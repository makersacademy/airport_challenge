# Airport Challenge

```
        ______
        _\____\___
=  = ==(___ALEX___)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

This is a small project simulating the takeoff and landing aspects of an airport, built as a challenge for Makers Academy. The development of this project was moved forwards using TDD.

I initially had trouble as I wanted to make the plane objects responsible for takeoff and landing, and found this difficult to implement - I found no true way around this, instead moving responsibility for this to the airport class.

## Getting Started

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

## Running an Airport

This irb transcript demonstrates how to control planes and airports:

``` ruby
2.4.0 :001 > require './lib/weather.rb'
 => true
2.4.0 :002 > require './lib/plane.rb'
 => true
2.4.0 :003 > require './lib/airport.rb'
 => true
2.4.0 :004 > airport = Airport.new
 => #<Airport:0x007f8ad5999d70 @hangar=[], @hangar_capacity=10, @weather_station=#<Weather:0x007f8ad599a428 @current_weather=:sunny>, @weather_condition=:sunny>
2.4.0 :005 > plane = Plane.new
 => #<Plane:0x007f8ad5990130>
2.4.0 :006 > airport.land(plane)
 => [#<Plane:0x007f8ad5990130>]
2.4.0 :007 > airport.update_weather
 => :sunny
2.4.0 :008 > airport.takeoff(plane)
 => #<Plane:0x007f8ad5990130>
```

## Running the Tests

The tests for this project are written with RSPEC, to run them simple run 'rspec' from the terminal in the project directory.

### About the tests

The tests are currently unit tests without an integration test. This project does not have 100% test coverage due to one update weather function in airport.rb. The only way I could think of for testing this method would be effectively testing a mock, so it is not included here. This function could, however, be easily tested in a feature test.
