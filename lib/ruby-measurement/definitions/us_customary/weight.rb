# encoding: UTF-8

Measurement.define(:ton) do |unit|
  unit.alias :'short ton', :'short tons', :tons
  unit.convert_to(:cwt) { |value| value * 20.0 }
  unit.convert_to(:lb) { |value| value * 2_000.0 }
  unit.convert_to(:oz) { |value| value * 32_000.0 }
  unit.convert_to(:dr) { |value| value * 512_000.0 }
  unit.convert_to(:gr) { |value| value * 14_000_000.0 }
end

Measurement.define(:cwt) do |unit|
  unit.alias :hundredweight, :hundredweights
  unit.convert_to(:ton) { |value| value / 20.0 }
  unit.convert_to(:lb) { |value| value * 100.0 }
  unit.convert_to(:oz) { |value| value * 1_600.0 }
  unit.convert_to(:dr) { |value| value * 25_600.0 }
  unit.convert_to(:gr) { |value| value * 700_000.0 }
end

Measurement.define(:lb) do |unit|
  unit.alias :lbs, :pound, :pounds
  unit.convert_to(:ton) { |value| value / 2000.0 }
  unit.convert_to(:cwt) { |value| value / 100.0 }
  unit.convert_to(:oz) { |value| value * 16.0 }
  unit.convert_to(:dr) { |value| value * 256.0 }
  unit.convert_to(:gr) { |value| value * 7_000.0 }
end

Measurement.define(:oz) do |unit|
  unit.alias :ounce, :ounces
  unit.convert_to(:ton) { |value| value / 32_000.0 }
  unit.convert_to(:cwt) { |value| value / 1_600.0 }
  unit.convert_to(:lb) { |value| value / 16.0 }
  unit.convert_to(:dr) { |value| value * 16.0 }
  unit.convert_to(:gr) { |value| value * 437.5 }
end

Measurement.define(:dr) do |unit|
  unit.alias :dram, :drams
  unit.convert_to(:ton) { |value| value / 512_000.0 }
  unit.convert_to(:cwt) { |value| value / 25_600.0 }
  unit.convert_to(:lb) { |value| value / 256.0 }
  unit.convert_to(:oz) { |value| value / 16.0 }
  unit.convert_to(:gr) { |value| value * 27.34375 }
end

Measurement.define(:gr) do |unit|
  unit.alias :grain, :grains
  unit.convert_to(:ton) { |value| value / 14_000_000.0 }
  unit.convert_to(:cwt) { |value| value / 700_000.0 }
  unit.convert_to(:lb) { |value| value / 7000.0 }
  unit.convert_to(:oz) { |value| value / 437.5 }
  unit.convert_to(:dr) { |value| value / 27.34375 }
end
