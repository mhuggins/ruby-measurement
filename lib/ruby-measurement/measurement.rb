# encoding: UTF-8

require 'ruby-measurement/unit'
require 'ruby-measurement/version'

class Measurement
  include Comparable

  UNIT_REGEX        = /([^\d\s\/].*)/.freeze
  SCIENTIFIC_NUMBER = /([+-]?\d*\.?\d+(?:[Ee][+-]?)?\d*)/.freeze
  SCIENTIFIC_REGEX  = /\A#{SCIENTIFIC_NUMBER}\s*#{UNIT_REGEX}?\z/.freeze
  RATIONAL_REGEX    = /\A([+-]?\d+\s+)?((\d+)\/(\d+))?\s*#{UNIT_REGEX}?\z/.freeze
  COMPLEX_REGEX     = /\A#{SCIENTIFIC_NUMBER}?#{SCIENTIFIC_NUMBER}i\s*#{UNIT_REGEX}?\z/.freeze

  RATIOS = {
    '¼' => '1/4',
    '½' => '1/2',
    '¾' => '3/4',
    '⅓' => '1/3',
    '⅔' => '2/3',
    '⅕' => '1/5',
    '⅖' => '2/5',
    '⅗' => '3/5',
    '⅘' => '4/5',
    '⅙' => '1/6',
    '⅚' => '5/6',
    '⅛' => '1/8',
    '⅜' => '3/8',
    '⅝' => '5/8',
    '⅞' => '7/8',
  }.freeze

  attr_reader :quantity, :unit

  def initialize(quantity, unit_name = :count)
    unit = unit_name
    unit = Unit[unit_name.to_s] if unit_name.kind_of?(Symbol) || unit_name.kind_of?(String)

    raise ArgumentError, "Invalid quantity: '#{quantity}'" unless quantity.kind_of?(Numeric)
    raise ArgumentError, "Invalid unit: '#{unit_name}'" unless unit.kind_of?(Unit)

    @quantity = quantity
    @unit = unit
  end

  def inspect
    to_s
  end

  def to_s
    "#{quantity} #{unit}"
  end

  %w(+ - * /).each do |operator|
    class_eval <<-END, __FILE__, __LINE__ + 1
      def #{operator}(obj)
        case obj
        when Numeric
          self.class.new(quantity #{operator} obj.to_f, unit)
        when self.class
          if obj.unit == unit
            self.class.new(quantity #{operator} obj.quantity, unit)
          else
            self #{operator} obj.convert_to(unit)
          end
        else
          raise ArgumentError, "Invalid arithmetic: \#{self} #{operator} \#{obj}"
        end
      end
    END
  end

  def **(obj)
    case obj
    when Numeric
      self.class.new(quantity ** obj.to_f, unit)
    else
      raise ArgumentError, "Invalid arithmetic: #{self} ** #{obj}"
    end
  end

  # def ==(obj)
  #   obj.kind_of?(self.class) && quantity == obj.quantity && unit == obj.unit
  # end

  def <=>(obj)
    return -1 unless obj.is_a(self.class)
    if quantity < obj.quantity
      -1
    elsif quantity > obj.quantity
      1
    else
      0
    end
  end

  def convert_to(unit_name)
    unit = Unit[unit_name]
    raise ArgumentError, "Invalid unit: '#{unit_name}'" unless unit

    return dup if unit == @unit

    conversion = @unit.conversion(unit.name)
    raise ArgumentError, "Invalid conversion: '#@unit' to '#{unit.name}'" unless conversion

    self.class.new(conversion.call(@quantity), unit.name)
  end

  def convert_to!(unit_name)
    measurement = convert_to(unit_name)
    @unit, @quantity = measurement.unit, measurement.quantity
    self
  end

  class << self
    def parse(str = '0')
      str = normalize(str)

      case str
        when COMPLEX_REGEX then unit_name, quantity = parse_complex(str)
        when SCIENTIFIC_REGEX then unit_name, quantity = parse_scientific(str)
        when RATIONAL_REGEX then unit_name, quantity = parse_rational(str)
        else raise ArgumentError, "Unable to parse: '#{str}'"
      end

      unit_name ||= 'count'
      unit = Unit[unit_name.strip.downcase]
      raise ArgumentError, "Invalid unit: '#{unit_name}'" unless unit

      new(quantity, unit)
    end

    def define(unit_name, &block)
      Unit.define(unit_name, &block)
    end

    private

    def normalize(string)
      string.dup.tap do |str|
        if str =~ Regexp.new(/(#{RATIOS.keys.join('|')})/)
          RATIOS.each do |search, replace|
            str.gsub!(search) { " #{replace}" }
          end
        end

        str.strip!
      end
    end

    def parse_complex(str)
      real, imaginary, unit_name = str.scan(COMPLEX_REGEX).first
      quantity = Complex(real.to_f, imaginary.to_f).to_f
      return unit_name, quantity
    end

    def parse_scientific(str)
      whole, unit_name = str.scan(SCIENTIFIC_REGEX).first
      quantity = whole.to_f
      return unit_name, quantity
    end

    def parse_rational(str)
      whole, _, numerator, denominator, unit_name = str.scan(RATIONAL_REGEX).first

      if numerator && denominator
        numerator = numerator.to_f + (denominator.to_f * whole.to_f)
        denominator = denominator.to_f
        quantity = Rational(numerator, denominator).to_f
      else
        quantity = whole.to_f
      end

      return unit_name, quantity
    end
  end

  define(:count) do |unit|
    unit.convert_to(:dozen) { |value| value / 12.0 }
  end

  define(:doz) do |unit|
    unit.alias :dozen
    unit.convert_to(:count) { |value| value * 12.0 }
  end
end
