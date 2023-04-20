# encoding: UTF-8

Measurement.define(:'km²') do |unit|
  unit.alias :km2, :'km^2', :'km*km', :'sq km', :'square kilometer', :'square kilometers'
  unit.convert_to(:ha) { |value| value * 100.0 }
  unit.convert_to(:a) { |value| value * 10_000.0 }
  unit.convert_to(:m2) { |value| value * 1_000_000.0 }
  unit.convert_to(:cm2) { |value| value * 10_000_000_000.0 }
end

Measurement.define(:ha) do |unit|
  unit.alias :hectare, :hectares
  unit.convert_to(:km2) { |value| value / 100.0 }
  unit.convert_to(:a) { |value| value * 100.0 }
  unit.convert_to(:m2) { |value| value * 10_000.0 }
  unit.convert_to(:cm2) { |value| value * 100_000_000.0 }
end

Measurement.define(:a) do |unit|
  unit.alias :are, :ares
  unit.convert_to(:km2) { |value| value / 10_000.0 }
  unit.convert_to(:ha) { |value| value / 100.0 }
  unit.convert_to(:m2) { |value| value * 100.0 }
  unit.convert_to(:cm2) { |value| value * 1_000_000.0 }
end

Measurement.define(:'m²') do |unit|
  unit.alias :m2, :'m^2', :'m*c', :'sq m', :'square meter', :'square meters'
  unit.convert_to(:km2) { |value| value / 1_000_000.0 }
  unit.convert_to(:ha) { |value| value / 10_000.0 }
  unit.convert_to(:a) { |value| value / 100 }
  unit.convert_to(:cm2) { |value| value * 10_000.0 }
end

Measurement.define(:'cm²') do |unit|
  unit.alias :cm2, :'cm^2', :'cm*cm', :'sq cm', :'square centimeter', :'square centimeters'
  unit.convert_to(:km2) { |value| value / 10_000_000_000.0 }
  unit.convert_to(:ha) { |value| value / 100_000_000.0 }
  unit.convert_to(:a) { |value| value / 1_000_000.0 }
  unit.convert_to(:m2) { |value| value / 10_000.0 }
end
