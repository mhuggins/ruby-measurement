# encoding: UTF-8

Measurement.define(:'acre ft') do |unit|
  unit.alias :'acre-foot', :'acre-feet'
  unit.convert_to(:yd3) { |value| value * 1_613.33333 }
  unit.convert_to(:ft3) { |value| value * 43_560.0 }
  unit.convert_to(:in3) { |value| value * 75_271_680.0 }
end

Measurement.define(:'yd³') do |unit|
  unit.alias :yd3, :'yd^3', :'yd*yd*yd', :'cubic yard', :'cubic yards'
  unit.convert_to(:'acre ft') { |value| value / 1_613.33333 }
  unit.convert_to(:ft3) { |value| value * 27.0 }
  unit.convert_to(:in3) { |value| value * 46_656.0 }
end

Measurement.define(:'ft³') do |unit|
  unit.alias :ft3, :'ft^3', :'ft*ft*ft', :'cubic foot', :'cubic feet'
  unit.convert_to(:'acre ft') { |value| value / 43_560.0 }
  unit.convert_to(:yd3) { |value| value / 27.0 }
  unit.convert_to(:in3) { |value| value * 1_728.0 }
end

Measurement.define(:'in³') do |unit|
  unit.alias :in3, :'in^3', :'in*in*in', :'cubic inch', :'cubic inches'
  unit.convert_to(:'acre ft') { |value| value / 75_271_680.0 }
  unit.convert_to(:yd3) { |value| value / 46_656.0 }
  unit.convert_to(:ft3) { |value| value / 1_728.0 }
end
