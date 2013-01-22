require 'ruby-measurement/unit'
require 'ruby-measurement/version'

class Measurement
  SCIENTIFIC_NUMBER = %r{([+-]?\d*[.]?\d+(?:[Ee][+-]?)?\d*)}.freeze
  RATIONAL_NUMBER   = /\A\(?([+-]?\d+)\/(\d+)\)?\z/.freeze
  COMPLEX_NUMBER    = /\A#{SCIENTIFIC_NUMBER}?#{SCIENTIFIC_NUMBER}i\b\z/.freeze
  
  attr_reader :quantity, :unit
  
  class << self;  attr_accessor :units end
  @units = {}
  
  def initialize(str)
    parse(str)
  end
  
  def inspect
    to_s
  end
  
  def to_s
    "#{quantity} #{unit}"
  end
  
  def +(obj)
    case obj
    when Numeric
      self.class.new("#{quantity + obj.to_f} #{unit}")
    when self.class
      if obj.unit == unit
        self.class.new("#{quantity + obj.quantity} #{unit}")
      else
        self + obj.convert_to(unit)
      end
    else
      raise ArgumentError, "Invalid arithmetic: #{self} + #{obj}"
    end
  end
  
  def -(obj)
    case obj
    when Numeric
      self.class.new("#{quantity - obj.to_f} #{unit}")
    when self.class
      if obj.unit == unit
        self.class.new("#{quantity - obj.quantity} #{unit}")
      else
        self - obj.convert_to(unit)
      end
    else
      raise ArgumentError, "Invalid arithmetic: #{self} - #{obj}"
    end
  end
  
  def *(obj)
    case obj
    when Numeric
      self.class.new("#{quantity * obj.to_f} #{unit}")
    when self.class
      if obj.unit == unit
        self.class.new("#{quantity * obj.quantity} #{unit}")
      else
        self * obj.convert_to(unit)
      end
    else
      raise ArgumentError, "Invalid arithmetic: #{self} * #{obj}"
    end
  end
  
  def /(obj)
    case obj
    when Numeric
      self.class.new("#{quantity / obj.to_f} #{unit}")
    when self.class
      if obj.unit == unit
        self.class.new("#{quantity / obj.quantity} #{unit}")
      else
        self / obj.convert_to(unit)
      end
    else
      raise ArgumentError, "Invalid arithmetic: #{self} / #{obj}"
    end
  end
  
  def **(obj)
    case obj
    when Numeric
      self.class.new("#{quantity ** obj.to_f} #{unit}")
    else
      raise ArgumentError, "Invalid arithmetic: #{self} ** #{obj}"
    end
  end
  
  def ==(obj)
    obj.kind_of?(self.class) && quantity == obj.quantity && unit == obj.unit
  end
  
  def convert_to(unit_name)
    unit = self.class.unit(unit_name)
    raise ArgumentError, "Invalid unit: '#{unit_name}'" unless unit
    
    return dup if unit == @unit
    
    conversion = @unit.conversion(unit.name)
    raise ArgumentError, "Invalid conversion: '#@unit' to '#{unit.name}'" unless conversion
    
    self.class.new("#{conversion.call(@quantity)} #{unit.name}")
  end
  
  def convert_to!(unit_name)
    measurement = convert_to(unit_name)
    @unit, @quantity = measurement.unit, measurement.quantity
    self
  end
  
  def self.unit(unit_name)
    unit_name = unit_name.to_s
    @units.values.find { |unit| unit.aliases.include?(unit_name) }
  end
  
  def self.parse(str = '0')
    new(str)
  end
  
  def self.define(unit_name, &block)
    unit = Unit.new(unit_name, &block)
    unit.aliases.each { |a| @units[a.downcase] = unit }
  end
  
  private
  
  def parse(str)
    value = str.strip
    
    quantity, unit_name = value.split(/\s+/, 2)
    unit_name ||= 'count'
    raise ArgumentError, "Missing quantity: '#{str}'" if !quantity || quantity.empty?
    
    @unit = self.class.units[unit_name.downcase]
    raise ArgumentError, "Invalid unit: '#{unit_name}'" unless @unit
    
    if quantity =~ COMPLEX_NUMBER
      real, imaginary = quantity.scan(COMPLEX_NUMBER).first
      @quantity = Complex(real.to_f, imaginary.to_f).to_f
    elsif quantity =~ RATIONAL_NUMBER
      numerator, denominator = quantity.scan(RATIONAL_NUMBER).first
      @quantity = Rational(numerator.to_i, denominator.to_i).to_f
    else
      @quantity = quantity.to_f
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
