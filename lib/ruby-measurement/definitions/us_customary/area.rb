# encoding: UTF-8

Measurement.define(:'mi²') do |unit|
  unit.alias :mi2, :'mi*mi', :'sq mi', :'square mile', :'square miles'
  unit.convert_to(:fur2) { |value| value * 64.0 }
  unit.convert_to(:ch2) { |value| value * 6_400.0 }
  unit.convert_to(:yd2) { |value| value * 3_097_600.0 }
  unit.convert_to(:ft2) { |value| value * 27_878_400.0 }
  unit.convert_to(:in2) { |value| value * 4_014_489_600.0 }
end

Measurement.define(:'fur²') do |unit|
  unit.alias :fur2, :'fur*fur', :'sq fur', :'square furlong', :'square furlongs'
  unit.convert_to(:mi2) { |value| value / 64.0 }
  unit.convert_to(:ch2) { |value| value * 100.0 }
  unit.convert_to(:yd2) { |value| value * 48_400.0 }
  unit.convert_to(:ft2) { |value| value * 435_600.0 }
  unit.convert_to(:in2) { |value| value * 62_726_400.0 }
end

Measurement.define(:'ch²') do |unit|
  unit.alias :ch2, :'ch*ch', :'sq ch', :'square chain', :'square chains'
  unit.convert_to(:mi2) { |value| value / 6_400.0 }
  unit.convert_to(:fur2) { |value| value / 100.0 }
  unit.convert_to(:yd2) { |value| value * 484.0 }
  unit.convert_to(:ft2) { |value| value * 4_356.0 }
  unit.convert_to(:in2) { |value| value * 627_264.0 }
end

Measurement.define(:'yd²') do |unit|
  unit.alias :yd2, :'yd*yd', :'sq yd', :'square yard', :'square yard'
  unit.convert_to(:mi2) { |value| value / 3_097_600.0 }
  unit.convert_to(:fur2) { |value| value / 48_400.0 }
  unit.convert_to(:ch2) { |value| value / 484.0 }
  unit.convert_to(:ft2) { |value| value * 9.0 }
  unit.convert_to(:in2) { |value| value * 1_296.0 }
end

Measurement.define(:'ft²') do |unit|
  unit.alias :ft2, :'ft*ft', :'sq ft', :'square foot', :'square foot'
  unit.convert_to(:mi2) { |value| value / 27_878_400.0 }
  unit.convert_to(:fur2) { |value| value / 435_600.0 }
  unit.convert_to(:ch2) { |value| value / 4_356.0 }
  unit.convert_to(:yd2) { |value| value / 9.0 }
  unit.convert_to(:in2) { |value| value * 144.0 }
end

Measurement.define(:'in²') do |unit|
  unit.alias :in2, :'in*in', :'sq in', :'square inch', :'square inches'
  unit.convert_to(:mi2) { |value| value / 4_014_489_600.0 }
  unit.convert_to(:fur2) { |value| value / 62_726_400.0 }
  unit.convert_to(:ch2) { |value| value / 627_264.0 }
  unit.convert_to(:yd2) { |value| value / 1_296.0 }
  unit.convert_to(:ft2) { |value| value / 144.0 }
end
