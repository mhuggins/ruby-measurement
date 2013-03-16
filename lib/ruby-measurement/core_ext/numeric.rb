require 'ruby-measurement/measurement'

class Numeric
  def to_measurement
    Measurement.new(self)
  end
end
