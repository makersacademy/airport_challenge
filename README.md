# Airport Challenge

Weekend task assigned by [Makers Academy](http://www.makersacademy.com/).

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

## Getting Started

1. Clone this repo to your local machine
2. Run the command ```gem install bundle``` (if you don't have bundle already)
3. When the installation is complete, run ```bundle```
4. Open IRB and run code examples or tests listed below

## Use Example

```
$ irb
2.2.3 :001 > require './lib/airport.rb'
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fafdb81ea88 @capacity=1, @planes=[], @weather=#<Weather:0x007fafdb81ea60>>
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fafdb0041b8>
2.2.3 :004 > airport.land(plane)
 => #<Airport:0x007fafdb81ea88 @capacity=1, @planes=[#<Plane:0x007fafdb0041b8>], @weather=#<Weather:0x007fafdb81ea60>>
2.2.3 :005 >
```

## Testing

Run the automated tests on this system using ```rspec``` and ```./spec/feature_test.rb```

## Built With

* [Rubocop](https://github.com/bbatsov/rubocop) - The Ruby static code analyzer used

## Authors

* [Nick Otter](nickotter.personal@gmail.com)

## Acknowledgments

* Makers Academy, Kay Lovelace
