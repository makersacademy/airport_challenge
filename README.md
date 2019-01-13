Airport Challenge [![Build Status](https://travis-ci.com/Estevenson1994/airport_challenge.svg?branch=master)](https://travis-ci.com/Estevenson1994/airport_challenge)
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

The aim of this challenge was to design a program that can control the landing and take off of planes at any aiport, given the weather conditions and airport capacity. The following user stories were used to design the program.

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

## Program Classes

The three classes used in this challenge were:

1. Airport
2. Plane
3. Weather

### 1. Airport

Properties:
- capacity - defines the maximum number of planes that can land at the airport. This can either be set when creating a new Airport object or automatically default to 20 if not specified.
- planes - an array which stores the planes that land at the airport

Methods:
- land(plane, weather) - lands plane at an airport given that the weather is sunny, the plane hasn't already landed and the airport isn't full.
- take_off(plane, weather) - allows a plane to take off given that the weather is sunny, and the plane is currently in the airport.
- taken_off?(plane) - confirms that the plane has taken off.
- full? - checks to see if the airport is a capacity
- landed? - checks to see if a plane has landed.


### 2. Plane

Properties:
- This class only allows plane objects to be created.

### 3. Weather

Properties:
- This class will give a 1 in 5 chance that the weather is stormy using a random number generator.

Methods:
- weather_possibilities - gives an array containing both sunny and stormy weather possibilities
- todays_weather - generates todays weather using a random number generator
- stormy? - checks to see if todays weather is stormy.

```
irb
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > gatwick = Airport.new(10)
 => #<Airport:0x00007fa7cb0e10d0 @planes=[], @capacity=10>
2.5.0 :003 > plane = Plane.new
 => #<Plane:0x00007fa7cb0d9268>
2.5.0 :004 > weather = Weather.new
 => #<Weather:0x00007fa7cb0d1338>
2.5.0 :005 > gatwick.land(plane, weather)
 => [#<Plane:0x00007fa7cb0d9268>]
2.5.0 :006 > gatwick.land(plane, weather)
RuntimeError (Plane has already landed)
2.5.0 :007 > gatwick.take_off(plane, weather)
 => #<Plane:0x00007fa7cb0d9268>
2.5.0 :008 > gatwick.taken_off?(plane)
 => true
2.5.0 :009 > gatwick.take_off(plane, weather)
RuntimeError (Plane is not in airport)
2.5.0 :010 > gatwick.land(plane, weather)
RuntimeError (Turbulent weather cannot takeoff)

```

Additional notes for potential improvement that was not attempted: The planes do not know whether they have landed or taken off so no errors are raised when trying to land the same plane into two different airports.
This could be modified by creating methods within the plane class that allows the plane to know its status and therefore raise errors when appropriate.
