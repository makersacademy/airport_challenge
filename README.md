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
About
-------

This is a small project designed to practice and consolidate test driven devlopment (TDD) and object oriented programming (OOP). You are the air traffic controller, and want to keep track of planes and airports under your remit. This code allows you to do this.

I have tried to follow a behaviour driven devlopment (BDD) cycle, by considering the user stories given see [here](docs/planning.md). Once I had an idea of the objects and messages they might use, I wrote feature tests and then unit tests to steadily implement the behaviour required.

As this is my first major attempt at OOP, BDD and TDD. I would definitely like to improve on the testing part, as I suspect a lot of tests might be superfluous and could be refactored. I also found that my feature tests and unit tests were similar at times (soemtimes the only difference being the unit tests were isolated).

Setup
-------

To run the code:
1. Clone the repo to your local machine
2. Change into the directory
3. run `bundle`
4. start `irb`

To run the tests:
1. Change into the main directory
2. run 'rspec'

Instructions
-------
You are the air traffic controller, see the below irb transcript as to how to use the software:
``` ruby
2.4.0 :001 > require './lib/airport.rb'
 => true 
2.4.0 :002 > airport = Airport.new
 => #<Airport:0x007fc1849608c8 @planes=[], @weather=#<Weather:0x007fc184960878 @outlook=:cloudy>, @capacity=10> 
2.4.0 :003 > plane = Plane.new
 => #<Plane:0x007fc184958d58 @status=:flying> 
2.4.0 :004 > airport.land plane
 => [#<Plane:0x007fc184958d58 @status=:parked>] 
2.4.0 :005 > airport
 => #<Airport:0x007fc1849608c8 @planes=[#<Plane:0x007fc184958d58 @status=:parked>], @weather=#<Weather:0x007fc184960878 @outlook=:cloudy>, @capacity=10> 
2.4.0 :006 > airport.take_off plane
 => #<Plane:0x007fc184958d58 @status=:flying> 
2.4.0 :007 > airport
 => #<Airport:0x007fc1849608c8 @planes=[], @weather=#<Weather:0x007fc184960878 @outlook=:cloudy>, @capacity=10>
```

You can also interrogate the plane and airport objects to find out about them:
``` ruby
2.4.0 :008 > airport.land plane
 => [#<Plane:0x007fc184958d58 @status=:parked>] 
2.4.0 :009 > airport.capacity
 => 10 
2.4.0 :010 > airport.weather.outlook
 => :cloudy 
2.4.0 :011 > airport.planes
 => [#<Plane:0x007fc184958d58 @status=:parked>] 
2.4.0 :012 > plane.status
 => :parked 
 ```
 
 Try creating more planes or airports and landing them as you need to. Beware an airport with stormy weather (1 in 6 chance on instantiation), you will not be able to land any planes.
 ```ruby
 2.4.0 :016 > airport = Airport.new
 => #<Airport:0x007fc185877f50 @planes=[], @weather=#<Weather:0x007fc185877f00 @outlook=:stormy>, @capacity=10> 
 ```
 
 Additionally
-------
Airports can be created with a different capacity to the default (10).
``` ruby
2.4.0 :017 > Airport.new(100)
 => #<Airport:0x007fc1858745f8 @planes=[], @weather=#<Weather:0x007fc1858745a8 @outlook=:cloudy>, @capacity=100> 
 ```
 The user can 'request' an update to see if the weather has changed
 ```ruby
2.4.0 :018 > airport.weather.update
 => :rainy 
