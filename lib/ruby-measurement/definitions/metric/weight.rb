# encoding: UTF-8

Measurement.define(:t) do |unit|
  unit.alias :'metric tonne', :'metric tonnes', :tonne, :tonnes
  unit.convert_to(:kg) { |value| value * 1_000.0 }
  unit.convert_to(:hg) { |value| value * 10_000.0 }
  unit.convert_to(:dag) { |value| value * 100_000.0 }
  unit.convert_to(:g) { |value| value * 1_000_000.0 }
  unit.convert_to(:dg) { |value| value * 10_000_000.0 }
  unit.convert_to(:cg) { |value| value * 100_000_000.0 }
  unit.convert_to(:mg) { |value| value * 1_000_000_000.0 }
  unit.convert_to(:µg) { |value| value * 10_000_000_000.0 }
end

Measurement.define(:kg) do |unit|
  unit.alias :kilogram, :kilograms
  unit.convert_to(:t) { |value| value / 1_000.0 }
  unit.convert_to(:hg) { |value| value * 10.0 }
  unit.convert_to(:dag) { |value| value * 100.0 }
  unit.convert_to(:g) { |value| value * 1_000.0 }
  unit.convert_to(:dg) { |value| value * 10_000.0 }
  unit.convert_to(:cg) { |value| value * 100_000.0 }
  unit.convert_to(:mg) { |value| value * 1_000_000.0 }
  unit.convert_to(:µg) { |value| value * 10_000_000.0 }
end

Measurement.define(:hg) do |unit|
  unit.alias :hectogram, :hectograms
  unit.convert_to(:t) { |value| value / 10_000.0 }
  unit.convert_to(:kg) { |value| value / 10.0 }
  unit.convert_to(:dag) { |value| value * 10.0 }
  unit.convert_to(:g) { |value| value * 100.0 }
  unit.convert_to(:dg) { |value| value * 1_000.0 }
  unit.convert_to(:cg) { |value| value * 10_000.0 }
  unit.convert_to(:mg) { |value| value * 100_000.0 }
  unit.convert_to(:µg) { |value| value * 1_000_000.0 }
end

Measurement.define(:dag) do |unit|
  unit.alias :dekagram, :dekagrams
  unit.convert_to(:t) { |value| value / 100_000.0 }
  unit.convert_to(:kg) { |value| value / 100.0 }
  unit.convert_to(:hg) { |value| value / 10.0 }
  unit.convert_to(:g) { |value| value * 10.0 }
  unit.convert_to(:dg) { |value| value * 100.0 }
  unit.convert_to(:cg) { |value| value * 1_000.0 }
  unit.convert_to(:mg) { |value| value * 10_000.0 }
  unit.convert_to(:µg) { |value| value * 100_000.0 }
end

Measurement.define(:g) do |unit|
  unit.alias :gram, :grams
  unit.convert_to(:t) { |value| value / 1_000_000.0 }
  unit.convert_to(:kg) { |value| value / 1_000.0 }
  unit.convert_to(:hg) { |value| value / 100.0 }
  unit.convert_to(:dag) { |value| value / 10.0 }
  unit.convert_to(:dg) { |value| value * 10.0 }
  unit.convert_to(:cg) { |value| value * 100.0 }
  unit.convert_to(:mg) { |value| value * 1_000.0 }
  unit.convert_to(:µg) { |value| value * 10_000.0 }
end

Measurement.define(:dg) do |unit|
  unit.alias :decigram, :decigrams
  unit.convert_to(:t) { |value| value / 10_000_000.0 }
  unit.convert_to(:kg) { |value| value / 10_000.0 }
  unit.convert_to(:hg) { |value| value / 1_000.0 }
  unit.convert_to(:dag) { |value| value / 100.0 }
  unit.convert_to(:g) { |value| value / 10.0 }
  unit.convert_to(:cg) { |value| value * 10.0 }
  unit.convert_to(:mg) { |value| value * 100.0 }
  unit.convert_to(:µg) { |value| value * 1_000.0 }
end

Measurement.define(:cg) do |unit|
  unit.alias :centigram, :centigrams
  unit.convert_to(:t) { |value| value / 100_000_000.0 }
  unit.convert_to(:kg) { |value| value / 100_000.0 }
  unit.convert_to(:hg) { |value| value / 10_000.0 }
  unit.convert_to(:dag) { |value| value / 1_000.0 }
  unit.convert_to(:g) { |value| value / 100.0 }
  unit.convert_to(:dg) { |value| value / 10.0 }
  unit.convert_to(:mg) { |value| value * 10.0 }
  unit.convert_to(:µg) { |value| value * 100.0 }
end

Measurement.define(:mg) do |unit|
  unit.alias :milligram, :milligrams
  unit.convert_to(:t) { |value| value / 1_000_000_000.0 }
  unit.convert_to(:kg) { |value| value / 1_000_000.0 }
  unit.convert_to(:hg) { |value| value / 100_000.0 }
  unit.convert_to(:dag) { |value| value / 10_000.0 }
  unit.convert_to(:g) { |value| value / 1_000.0 }
  unit.convert_to(:dg) { |value| value / 100.0 }
  unit.convert_to(:cg) { |value| value / 10.0 }
  unit.convert_to(:µg) { |value| value * 10.0 }
end

Measurement.define(:µg) do |unit|
  unit.alias :microgram, :micrograms
  unit.convert_to(:t) { |value| value / 10_000_000_000.0 }
  unit.convert_to(:kg) { |value| value / 10_000_000.0 }
  unit.convert_to(:hg) { |value| value / 1_000_000.0 }
  unit.convert_to(:dag) { |value| value / 100_000.0 }
  unit.convert_to(:g) { |value| value / 10_000.0 }
  unit.convert_to(:dg) { |value| value / 1_000.0 }
  unit.convert_to(:cg) { |value| value / 100.0 }
  unit.convert_to(:mg) { |value| value / 10.0 }
end
