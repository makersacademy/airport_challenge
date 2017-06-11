# Airport Challenge

Task - Build a basic web app which allows you to direct planes to land and take off from an airport taking into consideration local weather conditions as well as any potential flaws in the program which may arise. Airports are to have a default capacity which can be manipulated if necessary (in a busy area).

Currently all tests are passing with a whopping 100% coverage!


## Installation
- Clone this repo to your local computer
- Navigate to the repo `cd <repo name>`
- Run `gem install bundle` from the command line
- Run `bundle`
- You may have to reinstall xcode if you are having problems updating to ruby 2.4.0. To do so use the command `xcode-select --install`


## User Stories

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport and confirm that it has landed 

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

My approach for solving this specific challenge was to create 3 separate classes for the Airport, Plane and Weather. The Airport, or the traffic controller, is responsible for landing, taking off, moving the planes in and out of the hangar, confirming the planes' statuses, checking the current weather conditions for take off and landing and preventing landing when at capacity. Initially, I wanted to initialize the weather when initializing the airport, but then the weather at the airport would always remain the same. Instead, I initialized the weather upon landing and taking off and airplane, so I could check for random occurences of stormy weather at that time. 

The Weather class simply initializes with a weather condition, provides a list of potential conditions (with a class variable) and reads the current weather condition. Similarly, the plane initializes with a status of nil and upon landing and taking off the airport calls the plane to change its status to "arrived" and "departed" respectively which the plane does itself. The plane also has a function called 'landed?' which checks if the plane has landed at a specific airport and the airplane cannot take off from an airport if it hasn't landed.

## Full implementation of the program

```
2.4.0 :002 > require "./lib/airport.rb"
 => true
2.4.0 :003 > heathrow = Airport.new
 => #<Airport:0x007fd4692489d0 @planes=[], @default_capacity=20>
2.4.0 :004 > gatwick = Airport.new
 => #<Airport:0x007fd4698bfed0 @planes=[], @default_capacity=20>
2.4.0 :005 > british_airways1234 = Plane.new
 => #<Plane:0x007fd4698b7a00 @status=nil>
2.4.0 :006 > heathrow.move_to_hangar(british_airways1234)
 => [#<Plane:0x007fd4698b7a00 @status="arrived">]
2.4.0 :007 > heathrow.take_off(british_airways1234)
The current weather is partly cloudy
 => #<Plane:0x007fd4698b7a00 @status="departed">
2.4.0 :008 > gatwick.land(british_airways1234)
The current weather is stormy
RuntimeError: Cannot land in stormy weather
  from /Users/jiniMcoroneo/Projects/Course/week_1/round_2/airport_challenge/lib/airport.rb:15:in `land'
  from (irb):8
  from /Users/jiniMcoroneo/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :009 > gatwick.land(british_airways1234)
The current weather is partly sunny
 => [#<Plane:0x007fd4698b7a00 @status="arrived">]
2.4.0 :010 > gatwick.planes
 => [#<Plane:0x007fd4698b7a00 @status="arrived">]
2.4.0 :011 > heathrow.planes
 => []
```
