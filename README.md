# Measurement

[ruby-measurement](https://github.com/mhuggins/ruby-measurement) is a simple
Ruby gem for calculating and converting units of measure.

## Installation

Add this line to your application's Gemfile:

    gem 'ruby-measurement'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-measurement

## Usage

The `Measurement` class is responsible for parsing strings to determine the
quantity entered as well as the unit of measure.  This can be done through the
`parse` method.

    Measurement.parse('3 feet')      # => 3.0 ft.
    Measurement.parse('25 fl oz')    # => 25.0 fl. oz.
    Measurement.parse('12 tonnes')   # => 12.0 t
    Measurement.parse('25 "')        # => 25.0 in.

The object returned by `Measurement.parse` is of type `Measurement`.

    m = Measurement.parse('12 yd')   # => 12.0 yd.
    Measurement.quantity             # => 12.0
    Measurement.unit                 # => yd.

The object returned by `Measurement#unit` is of type `Measurement::Unit`.

    u = Measurement.unit             # => yd.
    u.name                           # => "yd."
    u.aliases                        # => ["yd.", "yd", "yard", "yards"]

## Converting units

This gem allows you to convert among compatible units as long as a conversion
has been supplied when defining a unit.  The default supplied units include
conversions among the same unit types (e.g.: converting feet to yards or meters
to kilometers).

    m = Measurement.parse('3 feet')  # => 3.0 ft.
    m.convert_to(:yards)             # => 1.0 yd.
    m.convert_to(:in)                # => 36.0 in.
    m.convert_to(:inches)            # => 36.0 in.

NOTE: Converting between metric and U.S. customary systems is currently not
included by default.  It is intended to be shipped in a future release.

## Calculations

This gem allows you to add, subtract, multiply, or divide measurements that can
be converted into one-another.

    m1 = Measurement.parse('3 feet') # => 3.0 ft.
    m2 = Measurement.parse('6 inch') # => 6.0 in.
    m1 + m2                          # => 3.5 ft.

Additionally, measurements can have basic math operations performed using basic
numeric values.

    m = Measurement.parse('2 yards') # => 2.0 yd.
    m * 6                            # => 12.0 yd.
    m / 5                            # => 0.4 yd.
    m + 3                            # => 5.0 yd.
    m - 1                            # => 1.0 yd.
    m ** 2                           # => 4.0 yd.

## Specifying units

By default, ruby-measurement ships with common areas, lengths, volumes, and
weights/masses for the metric and U.S. customary systems.  This happens
automatically when requiring the gem in the following manner.

    require 'ruby-measurement'

To include just one of these systems of measure, require the gem in per the
following.

    require 'ruby-measurement/measurement'
    
    # Metric units/conversions
    require 'ruby-measurement/definitions/metric'
    
    # U.S. customary units/conversions
    require 'ruby-measurement/definitions/us_customary'

Additionally, specific categories of units of measure can be included per
system.

    require 'ruby-measurement/measurement'
    
    # Metric units/conversions
    require 'ruby-measurement/definitions/metric/area'
    require 'ruby-measurement/definitions/metric/length'
    require 'ruby-measurement/definitions/metric/volume'
    require 'ruby-measurement/definitions/metric/weight'
    
    # U.S. customary units/conversions
    require 'ruby-measurement/definitions/us_customary/area'
    require 'ruby-measurement/definitions/us_customary/length'
    require 'ruby-measurement/definitions/us_customary/volume'
    require 'ruby-measurement/definitions/us_customary/weight'

## Defining custom units & conversions

This gem also enabled you to define units of measure that aren't included by
default.

    Measurement.define(:day) do |unit|
      unit.alias :days
      unit.convert_to(:week) { |value| value / 7.0 }
      unit.convert_to(:year) { |value| value / 365.0 }
    end
    
    Measurement.define(:wk) do |unit|
      unit.alias :week, :weeks
      unit.convert_to(:day) { |value| value * 7.0 }
      unit.convert_to(:year) { |value| value / 52.0 }
    end
    
    Measurement.define(:yr) do |unit|
      unit.alias :year, :years
      unit.convert_to(:day) { |value| value * 365.0 }
      unit.convert_to(:week) { |value| value * 52.0 }
    end

Note that the first value passed to `Measurement.define` is the unit format
that will be used when displaying a measurement.

    Measurement.parse('3 yr')        # => 3.0 yr
    Measurement.parse('3 year')      # => 3.0 yr
    Measurement.parse('3 years')     # => 3.0 yr

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

ruby-measurement is released under the [MIT License](http://www.opensource.org/licenses/MIT).
