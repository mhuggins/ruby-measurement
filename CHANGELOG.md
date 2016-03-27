## ruby-measurement 1.2.3 (Mar 27, 2016)

* Updated parsing to accept UTF-8 fractions (½, ⅓, etc.). *Matt Huggins*

## ruby-measurement 1.2.2 (Jul 13, 2014)

* Fixed `Measurement::Unit#==` to properly compare units. *Matt Huggins*

## ruby-measurement 1.2.1 (Jul 27, 2013)

* Added `Measurement.names` to list all available units. *Daniele Palombo*

## ruby-measurement 1.2.0 (Mar 16, 2013)

* Added `String#to_measurement`, `String#to_unit`,
  `Symbol#to_unit`, and `Numeric#to_measurement`. *Matt Huggins*

## ruby-measurement 1.1.0 (Feb 6, 2013)

* Moved unit definition logic into `Unit` class. *Matt Huggins*
* Added test suite. *Matt Huggins*
* Fixed parsing of `'` and `"` for feet and inches. *Matt Huggins*
* Added missing metric weights and U.S. customary capacities. *Matt Huggins*
* Fixed several conversions that were found to be miscalculating.
  *Matt Huggins*

## ruby-measurement 1.0.0 (Jan 22, 2013)

* Fixed parsing of mixed fractions. *Matt Huggins*
* Updated parsing of quantity & unit to work when not separated by a space.
  *Matt Huggins*
* Updated `Measurement` initializer to accept quantity & unit instead of a
  single string for parsing. *Matt Huggins*

## ruby-measurement 0.0.1 (Jan 21, 2013)

* Initial release. *Matt Huggins*
