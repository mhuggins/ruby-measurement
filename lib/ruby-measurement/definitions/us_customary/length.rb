# encoding: UTF-8

Measurement.define(:'mi.') do |unit|
  unit.alias :mi, :mile, :miles
  unit.convert_to(:fur) { |value| value * 8.0 }
  unit.convert_to(:ch) { |value| value * 80.0 }
  unit.convert_to(:ftm) { |value| value * 880.0 }
  unit.convert_to(:yd) { |value| value * 1_760.0 }
  unit.convert_to(:ft) { |value| value * 5_280.0 }
  unit.convert_to(:in) { |value| value * 63_360.0 }
  unit.convert_to(:th) { |value| value * 63_360_000.0 }
end

Measurement.define(:'fur.') do |unit|
  unit.alias :fur, :furlong, :furlongs
  unit.convert_to(:mi) { |value| value / 8.0 }
  unit.convert_to(:ch) { |value| value * 10.0 }
  unit.convert_to(:ftm) { |value| value * 110.0 }
  unit.convert_to(:yd) { |value| value * 220.0 }
  unit.convert_to(:ft) { |value| value * 660.0 }
  unit.convert_to(:in) { |value| value * 7_920.0 }
  unit.convert_to(:th) { |value| value * 7_920_000.0 }
end

Measurement.define(:'ch.') do |unit|
  unit.alias :ch, :chain, :chains
  unit.convert_to(:mi) { |value| value / 80.0 }
  unit.convert_to(:fur) { |value| value / 10.0 }
  unit.convert_to(:ftm) { |value| value * 11.0 }
  unit.convert_to(:yd) { |value| value * 22.0 }
  unit.convert_to(:ft) { |value| value * 66.0 }
  unit.convert_to(:in) { |value| value * 792.0 }
  unit.convert_to(:th) { |value| value * 792_000.0 }
end

Measurement.define(:'ftm.') do |unit|
  unit.alias :ftm, :fathom, :fathoms
  unit.convert_to(:mi) { |value| value / 880.0 }
  unit.convert_to(:fur) { |value| value / 110.0 }
  unit.convert_to(:ch) { |value| value / 11.0 }
  unit.convert_to(:yd) { |value| value * 2.0 }
  unit.convert_to(:ft) { |value| value * 6.0 }
  unit.convert_to(:in) { |value| value * 72.0 }
  unit.convert_to(:th) { |value| value * 72_000.0 }
end

Measurement.define(:'yd.') do |unit|
  unit.alias :yd, :yard, :yards
  unit.convert_to(:mi) { |value| value / 1_760.0 }
  unit.convert_to(:fur) { |value| value / 220.0 }
  unit.convert_to(:ch) { |value| value / 22.0 }
  unit.convert_to(:ftm) { |value| value / 2.0 }
  unit.convert_to(:ft) { |value| value * 3.0 }
  unit.convert_to(:in) { |value| value * 36.0 }
  unit.convert_to(:th) { |value| value * 36_000.0 }
end

Measurement.define(:'ft.') do |unit|
  unit.alias :ft, :foot, :feet, :"'"
  unit.convert_to(:mi) { |value| value / 5_280.0 }
  unit.convert_to(:ch) { |value| value / 66.0 }
  unit.convert_to(:fur) { |value| value / 660.0 }
  unit.convert_to(:yd) { |value| value / 3.0 }
  unit.convert_to(:ftm) { |value| value / 6.0 }
  unit.convert_to(:in) { |value| value * 12.0 }
  unit.convert_to(:th) { |value| value * 12_000.0 }
end

Measurement.define(:'in.') do |unit|
  unit.alias :in, :inch, :inches, :'"'
  unit.convert_to(:mi) { |value| value / 63_360.0 }
  unit.convert_to(:fur) { |value| value / 7_920.0 }
  unit.convert_to(:ch) { |value| value / 792.0 }
  unit.convert_to(:ftm) { |value| value / 72.0 }
  unit.convert_to(:yd) { |value| value / 36.0 }
  unit.convert_to(:ft) { |value| value / 12.0 }
  unit.convert_to(:th) { |value| value * 1000.0 }
end

Measurement.define(:'th.') do |unit|
  unit.alias :th, :thou
  unit.convert_to(:mi) { |value| value / 63_360_000.0 }
  unit.convert_to(:fur) { |value| value / 7_920_000.0 }
  unit.convert_to(:ch) { |value| value / 792_000.0 }
  unit.convert_to(:ftm) { |value| value / 72_000.0 }
  unit.convert_to(:yd) { |value| value / 36_000.0 }
  unit.convert_to(:ft) { |value| value / 12_000.0 }
  unit.convert_to(:in) { |value| value / 1000.0 }
end
