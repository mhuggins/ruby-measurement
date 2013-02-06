# encoding: UTF-8

Measurement.define(:kl) do |unit|
  unit.alias :kiloliter, :kiloliters
  unit.convert_to(:hl) { |value| value * 10.0 }
  unit.convert_to(:dal) { |value| value * 100.0 }
  unit.convert_to(:l) { |value| value * 1000.0 }
  unit.convert_to(:dl) { |value| value * 10000.0 }
  unit.convert_to(:cl) { |value| value * 100000.0 }
  unit.convert_to(:ml) { |value| value * 1000000.0 }
  unit.convert_to(:µl) { |value| value * 10000000.0 }
end

Measurement.define(:hl) do |unit|
  unit.alias :hectoliter, :hectoliters
  unit.convert_to(:kl) { |value| value / 10.0 }
  unit.convert_to(:dal) { |value| value * 10.0 }
  unit.convert_to(:l) { |value| value * 100.0 }
  unit.convert_to(:dl) { |value| value * 1_000.0 }
  unit.convert_to(:cl) { |value| value * 10_000.0 }
  unit.convert_to(:ml) { |value| value * 100_000.0 }
  unit.convert_to(:µl) { |value| value * 1_000_000.0 }
end

Measurement.define(:dal) do |unit|
  unit.alias :dekaliter, :dekaliters
  unit.convert_to(:kl) { |value| value / 100.0 }
  unit.convert_to(:hl) { |value| value / 10.0 }
  unit.convert_to(:l) { |value| value * 10.0 }
  unit.convert_to(:dl) { |value| value * 100.0 }
  unit.convert_to(:cl) { |value| value * 1_000.0 }
  unit.convert_to(:ml) { |value| value * 10_000.0 }
  unit.convert_to(:µl) { |value| value * 100_000.0 }
end

Measurement.define(:l) do |unit|
  unit.alias :liter, :liters
  unit.convert_to(:kl) { |value| value / 1_000.0 }
  unit.convert_to(:hl) { |value| value / 100.0 }
  unit.convert_to(:dal) { |value| value / 10.0 }
  unit.convert_to(:dl) { |value| value * 10.0 }
  unit.convert_to(:cl) { |value| value * 100.0 }
  unit.convert_to(:ml) { |value| value * 1_000.0 }
  unit.convert_to(:µl) { |value| value * 10_000.0 }
end

Measurement.define(:dl) do |unit|
  unit.alias :deciliter, :deciliters
  unit.convert_to(:kl) { |value| value / 10_000.0 }
  unit.convert_to(:hl) { |value| value / 1_000.0 }
  unit.convert_to(:dal) { |value| value / 100.0 }
  unit.convert_to(:l) { |value| value / 10.0 }
  unit.convert_to(:cl) { |value| value * 10.0 }
  unit.convert_to(:ml) { |value| value * 100.0 }
  unit.convert_to(:µl) { |value| value * 1_000.0 }
end

Measurement.define(:cl) do |unit|
  unit.alias :centiliter, :centiliters
  unit.convert_to(:kl) { |value| value / 10_0000.0 }
  unit.convert_to(:hl) { |value| value / 10_000.0 }
  unit.convert_to(:dal) { |value| value / 1_000.0 }
  unit.convert_to(:l) { |value| value / 100.0 }
  unit.convert_to(:dl) { |value| value / 10.0 }
  unit.convert_to(:ml) { |value| value * 10.0 }
  unit.convert_to(:µl) { |value| value * 100.0 }
end

Measurement.define(:ml) do |unit|
  unit.alias :milliliter, :milliliters
  unit.convert_to(:kl) { |value| value / 1_000_000.0 }
  unit.convert_to(:hl) { |value| value / 100_000.0 }
  unit.convert_to(:dal) { |value| value / 10_000.0 }
  unit.convert_to(:l) { |value| value / 1_000.0 }
  unit.convert_to(:dl) { |value| value / 100.0 }
  unit.convert_to(:cl) { |value| value / 10.0 }
  unit.convert_to(:µl) { |value| value * 10.0 }
end

Measurement.define(:µl) do |unit|
  unit.alias :microliter, :microliters
  unit.convert_to(:kl) { |value| value / 10_000_000.0 }
  unit.convert_to(:hl) { |value| value / 1_000_000.0 }
  unit.convert_to(:dal) { |value| value / 100_000.0 }
  unit.convert_to(:l) { |value| value / 10_000.0 }
  unit.convert_to(:dl) { |value| value / 1_000.0 }
  unit.convert_to(:cl) { |value| value / 100.0 }
  unit.convert_to(:ml) { |value| value / 10.0 }
end
