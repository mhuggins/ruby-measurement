# encoding: UTF-8

Measurement.define(:km) do |unit|
  unit.alias :kilometer, :kilometers
  unit.convert_to(:hm) { |value| value * 10.0 }
  unit.convert_to(:dam) { |value| value * 100.0 }
  unit.convert_to(:m) { |value| value * 1_000.0 }
  unit.convert_to(:dm) { |value| value * 10_000.0 }
  unit.convert_to(:cm) { |value| value * 100_000.0 }
  unit.convert_to(:mm) { |value| value * 1_000_000.0 }
  unit.convert_to(:µm) { |value| value * 10_000_000.0 }
end

Measurement.define(:hm) do |unit|
  unit.alias :hectometer, :hectometers
  unit.convert_to(:km) { |value| value / 10.0 }
  unit.convert_to(:dam) { |value| value * 10.0 }
  unit.convert_to(:m) { |value| value * 100.0 }
  unit.convert_to(:dm) { |value| value * 1_000.0 }
  unit.convert_to(:cm) { |value| value * 10_000.0 }
  unit.convert_to(:mm) { |value| value * 100_000.0 }
  unit.convert_to(:µm) { |value| value * 1_000_000.0 }
end

Measurement.define(:dam) do |unit|
  unit.alias :dekameter, :dekameters
  unit.convert_to(:km) { |value| value / 100.0 }
  unit.convert_to(:hm) { |value| value / 10.0 }
  unit.convert_to(:m) { |value| value * 10.0 }
  unit.convert_to(:dm) { |value| value * 100.0 }
  unit.convert_to(:cm) { |value| value * 1_000.0 }
  unit.convert_to(:mm) { |value| value * 10_000.0 }
  unit.convert_to(:µm) { |value| value * 100_000.0 }
end

Measurement.define(:m) do |unit|
  unit.alias :meter, :meters
  unit.convert_to(:km) { |value| value / 1_000.0 }
  unit.convert_to(:hm) { |value| value / 100.0 }
  unit.convert_to(:dam) { |value| value / 10.0 }
  unit.convert_to(:dm) { |value| value * 10.0 }
  unit.convert_to(:cm) { |value| value * 100.0 }
  unit.convert_to(:mm) { |value| value * 1_000.0 }
  unit.convert_to(:µm) { |value| value * 10_000.0 }
end

Measurement.define(:dm) do |unit|
  unit.alias :decimeter, :decimeters
  unit.convert_to(:km) { |value| value / 10_000.0 }
  unit.convert_to(:hm) { |value| value / 1_000.0 }
  unit.convert_to(:dam) { |value| value / 100.0 }
  unit.convert_to(:m) { |value| value / 10.0 }
  unit.convert_to(:cm) { |value| value * 10.0 }
  unit.convert_to(:mm) { |value| value * 100.0 }
  unit.convert_to(:µm) { |value| value * 1_000.0 }
end

Measurement.define(:cm) do |unit|
  unit.alias :centimeter, :centimeters
  unit.convert_to(:km) { |value| value / 100_000.0 }
  unit.convert_to(:hm) { |value| value / 10_000.0 }
  unit.convert_to(:dam) { |value| value / 1_000.0 }
  unit.convert_to(:m) { |value| value / 100.0 }
  unit.convert_to(:dm) { |value| value / 10.0 }
  unit.convert_to(:mm) { |value| value * 10.0 }
  unit.convert_to(:µm) { |value| value * 100.0 }
end

Measurement.define(:mm) do |unit|
  unit.alias :millimeter, :millimeters
  unit.convert_to(:km) { |value| value / 1_000_000.0 }
  unit.convert_to(:hm) { |value| value / 100_000.0 }
  unit.convert_to(:dam) { |value| value / 10_000.0 }
  unit.convert_to(:m) { |value| value / 1_000.0 }
  unit.convert_to(:dm) { |value| value / 100.0 }
  unit.convert_to(:cm) { |value| value / 10.0 }
  unit.convert_to(:µm) { |value| value * 10.0 }
end

Measurement.define(:µm) do |unit|
  unit.alias :micrometer, :micrometers
  unit.convert_to(:km) { |value| value / 10_000_000.0 }
  unit.convert_to(:hm) { |value| value / 1_000_000.0 }
  unit.convert_to(:dam) { |value| value / 100_000.0 }
  unit.convert_to(:m) { |value| value / 10_000.0 }
  unit.convert_to(:dm) { |value| value / 1_000.0 }
  unit.convert_to(:cm) { |value| value / 100.0 }
  unit.convert_to(:mm) { |value| value / 10.0 }
end
