require 'set'

class Measurement
  class Unit
    attr_reader :name, :aliases, :conversions
    
    @definitions = {}
    
    def initialize(name)
      @name = name.to_s
      @aliases = Set.new
      @conversions = {}
      add_alias(name)
    end
    
    def add_alias(*args)
      args.each do |unit_alias|
        @aliases << unit_alias.to_s
        self.class[unit_alias] = self
      end
    end
    
    def add_conversion(unit_name, &block)
      @conversions[unit_name.to_s] = block
    end
    
    def conversion(unit_name)
      unit = self.class[unit_name]
      return nil unless unit
      
      unit.aliases.each do |unit_alias|
        conversion = @conversions[unit_alias.to_s]
        return conversion if conversion
      end
      
      nil
    end
    
    def inspect
      to_s
    end
    
    def to_s
      name
    end
    
    def ==(obj)
      obj.kind_of?(self.class) && hash == obj.hash
    end
    
    def self.define(unit_name, &block)
      Builder.new(unit_name, &block)
    end
    
    def self.[](unit_name)
      @definitions[unit_name.to_s.downcase]
    end
    
    def self.all
      @definitions.keys
    end
    
    private
    
    def self.[]=(unit_name, unit)
      @definitions[unit_name.to_s.downcase] = unit
    end
    
    class Builder
      def initialize(unit_name, &block)
        @unit = Unit.new(unit_name)
        block.call(self) if block_given?
      end
      
      def alias(*args)
        @unit.add_alias(*args)
      end
      
      def convert_to(unit_name, &block)
        @unit.add_conversion(unit_name, &block)
      end
      
      def to_unit
        @unit
      end
    end
  end
end
