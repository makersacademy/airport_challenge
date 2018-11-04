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

My process in implementing each user story was to use a test driven approach:

1. Identify the objects and messages in each user story.
2. Translate this into a feature test in IRB.
3. Use a TDD approach to implement each user story:
  - Write a unit test and watch it fail.
  - Write minimal code to pass the unit test.
  - Refactor the code.

# How I tackled each User Story

## User Story 1
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
For this user story I identified the traffic controller as the user, the plane and airport as objects, and land as the message to send between them.

Firstly, I decided to create both an Airport class and Plane class. I then created a 'land' method within the Airport class.

This would accept an argument (i.e plane) and store it in an array. I then decided when the Airport class was instantiated, it should have an empty array to act as a hangar ready to store planes in.

This is behaviour is shown in IRB below.
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

This behaviour is demonstrated in IRB below.
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

This behaviour is demonstrated in IRB below. Beware I had to edit this demo together due to the weather being unpredictable!
```
2.5.0 :001 > require './lib/airport'
 => true
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007f92289337f0 @hangar=[], @weather=#<WeatherSystem:0x00007f92289337a0>, @capacity=5>
2.5.0 :003 > plane = Plane.new
 => #<Plane:0x00007f9228923968 @in_flight=true>
2.5.0 :004 > airport.land(plane)
 => [#<Plane:0x00007f9228923968 @in_flight=false>]
2.5.0 :005 > airport.weather_check
 => "Stormy"
2.5.0 :009 > airport.take_off(plane)
Traceback (most recent call last):
        4: from /Users/chris/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        3: from (irb):9
        2: from /Users/chris/CodeProjects/Makers/wk-1/airport_challenge/lib/airport.rb:18:in `take_off'
        1: from /Users/chris/CodeProjects/Makers/wk-1/airport_challenge/lib/airport.rb:33:in `not_valid_take_off?'
RuntimeError (Plane cannot take off during storm!)
```

## User Story 4
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
This user story very much built on the previous one. I simply mirrored the 'not_valid_take_off?' method and built a private 'not_valid_land?' method. I then used this in the existing 'land' method and set planes to only be able to land if 'not_valid_land?' did not raise an error.

As I did with 'not_valid_take_off?', I instructed 'not_valid_land?' to raise an error if when it called the weather_check method it did not return 'stormy'.

Here is an IRB session demonstrating the described behaviour.
```
2.5.0 :001 > require './lib/airport'
 => true
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007ff4d78a3be8 @hangar=[], @weather=#<WeatherSystem:0x00007ff4d78a3b98>, @capacity=5>
2.5.0 :003 > plane = Plane.new
 => #<Plane:0x00007ff4d7893cc0 @in_flight=true>
2.5.0 :006 > airport.land(plane)
Traceback (most recent call last):
        4: from /Users/chris/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        3: from (irb):6
        2: from /Users/chris/CodeProjects/Makers/wk-1/airport_challenge/lib/airport.rb:14:in `land'
        1: from /Users/chris/CodeProjects/Makers/wk-1/airport_challenge/lib/airport.rb:40:in `not_valid_land?'
RuntimeError (Plane cannot land during storm!)
```

## User Story 5
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
In order to classify what 'full' would be, I created a constant 'DEFAULT_CAPACITY', in the Airport class. I initially set it at 5 to make it manageable and easy to test.

I then created another private method 'airport_full?' which would simply check to see if the hangar size was equal or greater than the capacity. If it was, it would return true.

I inserted a new error message into 'not_valid_land?' which would raise 'Unable to land when airport is full!' if 'airport_full?' was returning true.

I then used this in my existing 'land' method, and like the stormy weather, set it to only allow planes to land if the airport was not full.

Here is a shortened IRB session to demonstrate the behaviour. There are 4 planes in the airport's hangar. I land a 5th and then try and land a 6th but an error is thrown as expected.
```
2.5.0 :017 > airport.hangar.size
 => 4
2.5.0 :018 > airport.land(p5)
 => [#<Plane:0x00007ff46b903f28 @in_flight=false>, #<Plane:0x00007ff46b900530 @in_flight=false>, #<Plane:0x00007ff46b888a08 @in_flight=false>, #<Plane:0x00007ff46b8f4de8 @in_flight=false>, #<Plane:0x00007ff46b8bc970 @in_flight=false>]
2.5.0 :019 > plane = Plane.new
 => #<Plane:0x00007ff46d00c3c8 @in_flight=true>
2.5.0 :020 > airport.land(plane)
Traceback (most recent call last):
        4: from /Users/chris/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        3: from (irb):20
        2: from /Users/chris/CodeProjects/Makers/wk-1/airport_challenge/lib/airport.rb:14:in `land'
        1: from /Users/chris/CodeProjects/Makers/wk-1/airport_challenge/lib/airport.rb:43:in `not_valid_land?'
RuntimeError (Unable to land when airport full!)
```

## User Story 6
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
This user story built on the previous one and was therefore relatively straightforward to implement.

In order to do this, I added an instance variable '@capacity' into the Airport's initialize method. I let it accept an argument - the custom capacity - but if this wasn't set it would simply default to the 'DEFAULT_CAPACITY' which I had set at 5.

Below is an IRB session demonstrating the setting of a custom capacity to 100.
```
2.5.0 :001 > require './lib/airport'
 => true
2.5.0 :002 > airport = Airport.new(100)
 => #<Airport:0x00007ffa4c16a230 @hangar=[], @weather=#<WeatherSystem:0x00007ffa4c16a1e0>, @capacity=100>
2.5.0 :003 > airport.capacity
 => 100
```  

# Final thoughts

Overall, I am relatively pleased with my implementation - it works and each user story has been satisfied.

However, I am still getting to grips with TDD and RSpec and I am aware that my unit tests could be refactored and make proper use of Mocks, Stubs and Doubles. My use of them has been rudimental.

Usefully, the challenge has made me aware of these techniques and they will be the next area of my focus.
