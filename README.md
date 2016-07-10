Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

# My attempt at the Airport Challenge #

## Libraries ##

./lib
  Contains:
    plane.rb
    airport.rb
    weather.rb
./spec
  Contains:
    plane_spec.rb
    airport_spec.rb
    weather_spec.rb

## Status ##

Completed user stories:

  As an air traffic controller
  So I can get passengers to a destination
  I want to instruct a plane to land at an airport and confirm that it has landed

  As an air traffic controller
  So I can get passengers on the way to their destination
  I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

Attempted user stories:

  As an air traffic controller
  To ensure safety
  I want to prevent takeoff when weather is stormy

  As an air traffic controller
  To ensure safety
  I want to prevent landing when weather is stormy

Successfully created and tested a random weather generator, but ran out of time trying to get this interacting with airport.

Not attempted:

  As an air traffic controller
  To ensure safety
  I want to prevent landing when the airport is full

  As the system designer
  So that the software can be used for many different airports
  I would like a default airport capacity that can be overridden as appropriate

## How to Use ##

```sh
require './lib/airport.rb'
plane = Plane.new
airport = Airport.new
airport.land(plane) #lands the given plane at the airport
airport.planes #returns landed planes
airport.take_off(plane) #the given plane will take off from the airport.
```
