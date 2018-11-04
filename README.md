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
# My approach to the challenge  

## User Story 1

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
To solve this user story I identified the traffic controller as the user, the plane and airport as objects and land as the message to send between them.

Firstly, I decided to create an Airport class and a Plane class. I decided that each instance of the Airport class should be instantiated with a hangar (array) to store the planes in.

I then created a 'land' method within the Airport class and this would accept a plane as an argument and store it in the hangar.

This is demonstrated in IRB as so:
```
2.5.0 :001 > require './lib/airport'
 => true
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007ffdb008fc18 @hangar=[], @weather=#<WeatherSystem:0x00007ffdb008fbc8>, @capacity=5>
2.5.0 :003 > plane = Plane.new
 => #<Plane:0x00007ffdb0083d00 @in_flight=true>
2.5.0 :004 > airport.land(plane)
 => [#<Plane:0x00007ffdb0083d00 @in_flight=false>]
2.5.0 :005 > airport.hangar
 => [#<Plane:0x00007ffdb0083d00 @in_flight=false>]
2.5.0 :006 >
```
