require 'ruby-measurement/unit'
require 'ruby-measurement/version'

class Measurement
  UNIT_REGEX        = /([^\d\s\/].*)/.freeze
  SCIENTIFIC_NUMBER = /([+-]?\d*\.?\d+(?:[Ee][+-]?)?\d*)/.freeze
  SCIENTIFIC_REGEX  = /\A#{SCIENTIFIC_NUMBER}\s*#{UNIT_REGEX}?\z/.freeze
  RATIONAL_REGEX    = /\A([+-]?\d+\s+)?((\d+)\/(\d+))?\s*#{UNIT_REGEX}?\z/.freeze
  COMPLEX_REGEX     = /\A#{SCIENTIFIC_NUMBER}?#{SCIENTIFIC_NUMBER}i\s*#{UNIT_REGEX}?\z/.freeze
  
  attr_reader :quantity, :unit
  
  def initialize(quantity, unit_name = :count)
    unit = unit_name
    unit = Unit[unit_name.to_s] if unit_name.kind_of?(Symbol) || unit_name.kind_of?(String)
    
    raise ArgumentError, "Invalid quantity: #{quantity}" unless quantity.kind_of?(Numeric)
    raise ArgumentError, "Invalid unit: #{unit_name}" unless unit.kind_of?(Unit)
    
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
  
  def ==(obj)
    obj.kind_of?(self.class) && quantity == obj.quantity && unit == obj.unit
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
  
  def self.parse(str = '0')
    str = str.strip
    
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
  
  def self.define(unit_name, &block)
    Unit.define(unit_name, &block)
  end
  
  private
  
  def self.parse_complex(str)
    real, imaginary, unit_name = str.scan(COMPLEX_REGEX).first
    quantity = Complex(real.to_f, imaginary.to_f).to_f
    return unit_name, quantity
  end
  
  def self.parse_scientific(str)
    whole, unit_name = str.scan(SCIENTIFIC_REGEX).first
    quantity = whole.to_f
    return unit_name, quantity
  end
  
  def self.parse_rational(str)
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
  
  define(:count) do |unit|
    unit.convert_to(:dozen) { |value| value / 12.0 }
  end
  
  define(:doz) do |unit|
    unit.alias :dozen
    unit.convert_to(:count) { |value| value * 12.0 }
  end
end
