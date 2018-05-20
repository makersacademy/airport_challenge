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

The task
---------

This is my response to the first weekend challenge at Makers Academy, to build an airport application in Ruby based on six user stories, using a TDD approach with RSpec. The airport should enable a plane to take off and land at an airport, depending on whether or not the weather is stormy, and the airport should have a default capacity that can be overridden when required.

This is a demonstration of how the app is used in full with an irb transcript:

```
[simonesmith:...s Academy/airport_challenge]$ irb                                        (master✱)
2.5.0 :001 > require './lib/airport.rb'
 => true
2.5.0 :002 > plane1 = Plane.new
 => #<Plane:0x00007fa520174e50>
2.5.0 :003 > plane2 = Plane.new
 => #<Plane:0x00007fa52010c328>
2.5.0 :004 > plane3 = Plane.new
 => #<Plane:0x00007fa5208dbbf8>
2.5.0 :005 > airport1 = Airport.new
 => #<Airport:0x00007fa5208c6410 @planes=[], @capacity=20, @weather=#<Weather:0x00007fa5208c6398>>
2.5.0 :006 > airport2 = Airport.new(2)
 => #<Airport:0x00007fa5200fe9f8 @planes=[], @capacity=2, @weather=#<Weather:0x00007fa5200fe9d0>>
2.5.0 :007 > airport1.land(plane1)
 => true
2.5.0 :008 > airport1.take_off(plane1)
 => false
2.5.0 :009 > airport2.land(plane1)
 => true
2.5.0 :010 > airport2.land(plane1)
Traceback (most recent call last):
        3: from /Users/simonesmith/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):10
        1: from /Users/simonesmith/Makers Academy/airport_challenge/lib/airport.rb:16:in `land'
RuntimeError (Plane has already landed)
2.5.0 :011 > airport2.land(plane2)
 => true
2.5.0 :012 > airport2.land(plane3)
Traceback (most recent call last):
        3: from /Users/simonesmith/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):12
        1: from /Users/simonesmith/Makers Academy/airport_challenge/lib/airport.rb:15:in `land'
RuntimeError (Airport is full)
2.5.0 :013 > airport2.take_off(plane3)
Traceback (most recent call last):
        3: from /Users/simonesmith/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):13
        1: from /Users/simonesmith/Makers Academy/airport_challenge/lib/airport.rb:23:in `take_off'
RuntimeError (Plane is not at airport)
2.5.0 :014 > airport1.land(plane3)
Traceback (most recent call last):
        3: from /Users/simonesmith/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):15
        1: from /Users/simonesmith/Makers Academy/airport_challenge/lib/airport.rb:17:in `land'
RuntimeError (Cannot land, weather is stormy)
```

User stories
---------

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

Edge cases
---------

* Planes can only take off from airports they are already in

* Planes that are already flying cannot take off or be in an airport

* Planes that are landed cannot land again and must be in an airport
