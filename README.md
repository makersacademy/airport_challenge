Airport Challenge
=================
####Created by Mark Hill 24/1/16

###Build software to control the flow of planes into an airport with TDD, in response to user stories.

###Content:
Three classes:

(1) Plane - Records the state of the plane (landed/not-landed), contains methods 'land' and 'takeoff' which check weather/ condition of the airport.

(2) Airport - Records the planes that have landed and the capacity of the airport. Contains full? method which checks to see if the number of planes has reached the capacity.

(3) Weather - Randomly generates a weather condition, with a 75% chance of sunny weather and a 25% chance of stormy weather.

###Example:
```
$ irb
2.2.3 :001 > require './lib/plane.rb'
 => true
2.2.3 :002 > plane = Plane.new
 => #<Plane:0x007fd563044f58>
2.2.3 :003 > airport = Airport.new
 => #<Airport:0x007fd5630346d0 @planes=[], @capacity=20>
2.2.3 :004 > plane.land(airport)
Landed!
 => true
2.2.3 :005 > plane.takeoff(airport)
Could not take off due to bad weather
 => true
2.2.3 :006 > plane.takeoff(airport)
The plane takes off!
 => false
```

###User Stories:


 Instruct a plane to land at an airport and confirm that it has landed
 
 Instruct a plane to take off from an airport and confirm that it is no longer in the airport
 
 Prevent takeoff when weather is stormy
 
 Prevent landing when weather is stormy
 
 Prevent landing when the airport is full
 
 Create a default airport capacity that can be overridden as appropriate
 
 Raise errors for inconsistent system states.
