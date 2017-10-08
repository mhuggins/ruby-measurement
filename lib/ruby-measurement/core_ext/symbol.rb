require 'ruby-measurement/unit'

class Symbol
  def to_unit
    Measurement::Unit[self] or raise ArgumentError, "Invalid unit: '#{self}'"
  end
end
