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
For this user story I identified the traffic controller as the user, the plane and airport as objects, and land as the message to send between them.

Firstly, I decided to create both an Airport class and Plane class. I then created a 'land' method within the Airport class.

This would accept an argument (i.e plane) and store it in an array. I then decided when the Airport class was instantiated, it should have an empty array to act as a hangar ready to store planes in.

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

## User Story 2
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
For this user story I decided to break it down into two parts: a) instruct a plane to take off and b) confirm that the plane is no longer in the airport.

Having decided in the previous user story that when a new airport was created it's hangar would be empty this meant I would need to create a plane and land it first before instructing it to take off and then confirm that it had done.

Firstly, I created a 'take off' method which would accept an argument as the plane you would like to instruct to take off. It would then take this argument and delete it from the hangar array.

Once the plane had been removed from the hangar it was no longer at the airport and thus 'taken off'.

In order to confirm this, and satisfy the second part of the user story, I created a 'confirm_take_off' method. This accepted an argument - the plane's take off you were seeking to confirm - and return 'plane has taken off' if indeed that plane had taken off by checking to see if it was no longer in the hangar array.

This is demonstrated in IRB as follows:
```
2.5.0 :001 > require './lib/airport'
 => true
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007fd8a290f790 @hangar=[], @weather=#<WeatherSystem:0x00007fd8a290f740>, @capacity=5>
2.5.0 :003 > plane = Plane.new
 => #<Plane:0x00007fd8a2907900 @in_flight=true>
2.5.0 :004 > airport.land(plane)
 => [#<Plane:0x00007fd8a2907900 @in_flight=false>]
2.5.0 :005 > airport.hangar
 => [#<Plane:0x00007fd8a2907900 @in_flight=false>]
2.5.0 :006 > airport.take_off(plane)
 => #<Plane:0x00007fd8a2907900 @in_flight=true>
2.5.0 :007 > airport.confirm_take_off(plane)
 => "Confirmed: #<Plane:0x00007fd8a2907900> has taken off!"
2.5.0 :008 > airport.hangar
 => []
```

## User Story 3
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
For this user story I decided to create a new class - the WeatherSystem. This would be responsible for generating the weather as either 'sunshine' or 'stormy'. We were instructed that it should only be stormy in rare cases so I decided to make it a 1 in 4 chance of being so - I wanted a bit of drama.

In order to do this, inside the WeatherSystem class I created the method 'rand_num_generator' which would simply generate a number between 1 and 4.

I then created a 'weather_output' method. This would return 'Stormy' if when called, the 'rand_num_generator' method returned a 1. This meant 3/4s of the time it would be 'Sunshine'.

I decided that when the Airport class was instantiated it should have it's own weather system. To do this, I added an instance variable '@weather' and set it to a new instance of the WeatherSystem class.

I then created a 'weather_check' method in the Airport class and this would return the current weather conditions by calling 'weather_output' on @weather.

Therefore, in order to prevent planes from taking off when the weather was stormy, I created a private method called 'not_valid_take_off?'. I added this to the existing 'take_off' method and set it to only allow planes to take off if 'not_valid_take_off?' was not returning an error.

I instructed 'not_valid_take_off?' to raise the error 'Plane cannot land during storm!' if when it called the 'weather_check' method it returned stormy weather.
