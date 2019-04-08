# Airport Challenge #

  This program replicates the landing and taking off of planes at an airport, as well as testing for weather conditions to ensure it is safe to land or take off.

  I approached this challenge by using TDD and debugging with Rspec tests to reach my final version. I wrote out a Rspec test that described my aim and then followed the error messages to create source-code that corresponded to those errors.

  It acts as practice for my Ruby and Rspec skills.

## How to get this program

  1. Clone the repository onto your device.
  2. Run 'gem install bundle' into your command line.
  3. Run 'bundle' after the installation has finished.
  4. You should be good to go!

## How to use in irb

  The following extract is an example of how to land a plane at the airport and then take off. It is shown in this example that sometimes your command can fail due to stormy weather, as it would be unsafe to take off or land in that condition.

```shell
2.5.0 :002 > require './lib/airport.rb'
 => true
2.5.0 :003 > airport = Airport.new
 => #<Airport:0x00007fa116858888 @capacity=10, @planes=[], @weather=#<Weather:0x00007fa116858860>>
2.5.0 :004 > plane = Plane.new
 => #<Plane:0x00007fa116848aa0>
2.5.0 :005 > airport.land(plane)
 => #<Airport:0x00007fa116858888 @capacity=10, @planes=[#<Plane:0x00007fa116848aa0>], @weather=#<Weather:0x00007fa116858860>>
2.5.0 :006 > airport.take_off(plane)
RuntimeError (Unable to take off due to stormy weather.)
2.5.0 :007 > airport.take_off(plane)
 => #<Plane:0x00007fa116848aa0>
2.5.0 :008 > exit
```

  If you are interested in changing the capacity of the airport, you should write an integer argument for a new Airport class instance, like this:

```shell
2.5.0 :002 > require './lib/airport.rb'
 => true
2.5.0 :003 > airport = Airport.new(30)
 => #<Airport:0x00007fa116858888 @capacity=30, @planes=[], @weather=#<Weather:0x00007fa116858860>>
```

## Rspec Tests

  This program should return all (12) green Rspec tests with 100% coverage and no offences detected in Rubocop.
