require 'set'

class Measurement
  class Unit
    attr_reader :name, :aliases, :conversions
    
    def initialize(name, &block)
      @name = name.to_s
      @aliases = Set.new
      @conversions = {}
      
      self.alias(name)
      block.call(self) if block_given?
    end
    
    def alias(*args)
      args.each { |arg| @aliases << arg.to_s }
    end
    
    def convert_to(name, &block)
      @conversions[name.to_s] = block
    end
    
    def conversion(name)
      Measurement.unit(name).aliases.each do |a|
        conversion = @conversions[a.to_s]
        return conversion if conversion
      end
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
  end
end
