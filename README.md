# Airport Challenge

Weekend task assigned by [Kay Lovelace](https://github.com/neoeno), [Makers Academy](http://www.makersacademy.com/).

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

# Usage

* Clone this repo to your local machine
* Open IRB and run code examples or tests (see [Testing](#testing))

## IRB Example

```
$ irb
2.4.0 :001 > require './lib/airport.rb'
 => true
2.4.0 :002 > airport = Airport.new
 => #<Airport:0x007fd4720552f0 @planes=[], @capacity=10, @weather=#<Weather:0x007fd472055278>>
2.4.0 :003 > plane = Plane.new
 => #<Plane:0x007fd47203f0b8>
2.4.0 :004 > airport.land(plane)
 => [#<Plane:0x007fd47203f0b8>]
2.4.0 :005 > airport
 => #<Airport:0x007fd4720552f0 @planes=[#<Plane:0x007fd47203f0b8>], @capacity=10, @weather=#<Weather:0x007fd472055278>>
2.4.0 :007 >
```

## Testing

Run the automated tests on this system using ```rspec``` and ```./spec/feature_test.rb```

## Built With

* [Rubocop](https://github.com/bbatsov/rubocop)

## Authors

* [Nick Otter](nickotter.personal@gmail.com)

## Acknowledgments

* [Makers Academy](http://www.makersacademy.com/), [Kay Lovelace](https://github.com/neoeno)
