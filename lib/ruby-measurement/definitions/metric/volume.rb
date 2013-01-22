# encoding: UTF-8

Measurement.define(:'m³') do |unit|
  unit.alias :m3, :'m^3', :'m*m*m', :'cubic meter', :'cubic meters'
  unit.convert_to(:dm3) { |value| value * 1_000.0 }
  unit.convert_to(:cm3) { |value| value * 1_000_000.0 }
end

Measurement.define(:'dm³') do |unit|
  unit.alias :dm3, :'dm^3', :'dm*dm*dm', :'cubic decimeter', :'cubic decimeters'
  unit.convert_to(:m3) { |value| value / 1_000.0 }
  unit.convert_to(:cm3) { |value| value * 1_000.0 }
end

Measurement.define(:'cm³') do |unit|
  unit.alias :cm3, :'cm^3', :'cm*cm*cm', :'cubic centimeter', :'cubic centimeters'
  unit.convert_to(:m3) { |value| value / 1_000_000.0 }
  unit.convert_to(:dm3) { |value| value / 1_000.0 }
end
