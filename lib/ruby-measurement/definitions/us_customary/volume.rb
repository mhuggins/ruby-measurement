# encoding: UTF-8

Measurement.define(:'gal.') do |unit|
  unit.alias :gal, :gallon, :gallons
  unit.convert_to(:qt) { |value| value * 4.0 }
  unit.convert_to(:pt) { |value| value * 8.0 }
  unit.convert_to(:c) { |value| value * 16.0 }
  unit.convert_to(:'fl oz') { |value| value * 128.0 }
  unit.convert_to(:tbsp) { |value| value * 256.0 }
  unit.convert_to(:tsp) { |value| value * 768.0 }
  unit.convert_to(:ml) { |value| value * 3785.411784 }
  unit.convert_to(:l) { |value| value * 3.785411784 }
end

Measurement.define(:'qt.') do |unit|
  unit.alias :qt, :quart, :quarts
  unit.convert_to(:gal) { |value| value / 4.0 }
  unit.convert_to(:pt) { |value| value * 2.0 }
  unit.convert_to(:c) { |value| value * 4.0 }
  unit.convert_to(:'fl oz') { |value| value * 32.0 }
  unit.convert_to(:tbsp) { |value| value * 64.0 }
  unit.convert_to(:tsp) { |value| value * 192.0 }
  unit.convert_to(:ml) { |value| value * 946.352946 }
  unit.convert_to(:l) { |value| value * 0.946352946 }
end

Measurement.define(:'pt.') do |unit|
  unit.alias :pt, :pint, :pints
  unit.convert_to(:gal) { |value| value / 8.0 }
  unit.convert_to(:qt) { |value| value / 2.0 }
  unit.convert_to(:c) { |value| value * 2.0 }
  unit.convert_to(:'fl oz') { |value| value * 16.0 }
  unit.convert_to(:tbsp) { |value| value * 32.0 }
  unit.convert_to(:tsp) { |value| value * 96.0 }
  unit.convert_to(:ml) { |value| value * 473.176473 }
  unit.convert_to(:l) { |value| value * 0.473176473 }
end

Measurement.define(:'c.') do |unit|
  unit.alias :c, :cup, :cups
  unit.convert_to(:gal) { |value| value / 16.0 }
  unit.convert_to(:qt) { |value| value / 4.0 }
  unit.convert_to(:pt) { |value| value / 2.0 }
  unit.convert_to(:'fl oz') { |value| value * 8.0 }
  unit.convert_to(:tbsp) { |value| value * 16.0 }
  unit.convert_to(:tsp) { |value| value * 48.0 }
  unit.convert_to(:ml) { |value| value * 236.5882365 }
  unit.convert_to(:l) { |value| value * 0.2365882365 }
end

Measurement.define(:'fl. oz.') do |unit|
  unit.alias :'fl oz', :'oz. fl.', :'fluid ounce', :'fluid ounces'
  unit.convert_to(:gal) { |value| value / 128.0 }
  unit.convert_to(:qt) { |value| value / 32.0 }
  unit.convert_to(:pt) { |value| value / 16.0 }
  unit.convert_to(:c) { |value| value / 8.0 }
  unit.convert_to(:tbsp) { |value| value * 2.0 }
  unit.convert_to(:tsp) { |value| value * 6.0 }
  unit.convert_to(:ml) { |value| value * 29.5735295625 }
  unit.convert_to(:l) { |value| value * 0.0295735295625 }
end

Measurement.define(:'tbsp.') do |unit|
  unit.alias :tbsp, :tablespoon, :tablespoons
  unit.convert_to(:gal) { |value| value / 256.0 }
  unit.convert_to(:qt) { |value| value / 64.0 }
  unit.convert_to(:pt) { |value| value / 32.0 }
  unit.convert_to(:c) { |value| value / 16.0 }
  unit.convert_to(:'fl oz') { |value| value / 2.0 }
  unit.convert_to(:tsp) { |value| value * 3.0 }
  unit.convert_to(:ml) { |value| value * 14.786764781 }
  unit.convert_to(:l) { |value| value * 0.014786764781 }
end

Measurement.define(:'tsp.') do |unit|
  unit.alias :tsp, :teaspoon, :teaspoons
  unit.convert_to(:gal) { |value| value / 768.0 }
  unit.convert_to(:qt) { |value| value / 192.0 }
  unit.convert_to(:pt) { |value| value / 96.0 }
  unit.convert_to(:c) { |value| value / 48.0 }
  unit.convert_to(:'fl oz') { |value| value / 6.0 }
  unit.convert_to(:tbsp) { |value| value / 3.0 }
  unit.convert_to(:ml) { |value| value * 4.9289215938 }
  unit.convert_to(:l) { |value| value * 0.0049289215938 }
end
