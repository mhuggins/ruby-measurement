require 'ruby-measurement/measurement'

class String
  def to_measurement
    Measurement.parse(self)
  end

  def to_unit
    Measurement::Unit[self] or raise ArgumentError, "Invalid unit: #{self}"
  end
end
