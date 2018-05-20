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
**Setting the weather**

Airports are initialized with a default weather setting. A new instance of `Weather` is injected by default into the `airport` at initialization, and is accessible via `attr_reader :weather`. The `stormy?` method in the `Weather` class is randomly set to true or false (it is stormy 30% of the time). When a plane lands, a guard clause calls the private method `stormy` within `Airport`. This returns true or false depending on the random outcome of `stormy?` in `Weather`.


**When the weather is good**

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

Instances of the class `Airport` can instruct instances of the class `Plane` to land. The `plane` is added to the `@planes` array.

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

Instances of the class `Airport` can instruct instances of the class `Plane` to take off. This `plane` is then removed from the `@planes` array.


**When the weather is stormy**

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

If the weather is stormy when the plane tries to take off, the error `Cannot take off, weather is stormy` is shown.

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

If the weather is stormy when the plane tries to land, the error `Cannot land, weather is stormy` is shown.


**Airport capacity**

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

Airports are initialized with a `DEFAULT_CAPACITY` of 20. When the airport is full (i.e. 20 planes have been instructed to land at the airport and added to the `@planes` array), the error `Airport is full` is shown on subsequent landing attempts.

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

An airport's default capacity can be overridden by specifying a capacity on initialization of an airport (e.g. `Heathrow = Airport.new(2)` will set the capacity of `Heathrow` to 2).


Edge cases
---------

* Planes can only take off from airports they are already in

  When `airport.land(plane)` is run, the `plane` is added to the `@planes` array in `airport`. `airport.take_off(plane)` checks whether the `plane` is in the array (`@planes.include?(plane)`); if it is not in the array, the error `Plane is not at airport` is shown.

* Planes that are already flying cannot take off or be in an airport

  When `airport.take_off(plane)` is run, the `plane` is deleted from the `airport`'s `@planes` array and the method `make_take_off` is called on `plane`. This method is defined in the `Plane` class, and it sets `@landed` to `false`.
  However, if the `plane` is not in the `@planes` array, it already can't be made to take off, so I think this edge case has already been covered.

* Planes that are landed cannot land again and must be in an airport

  When `airport.land(plane)` is run, the `plane` is added to the `airport`'s `@planes` array and the method `make_land` is called on `plane`. This method is defined in the `Plane` class, and it sets `@landed` to `true`.
  The next time the user tries to land that plane, a guard condition checks if `@landed` is `true` via the `landed?` method in `Plane`, and if so the error `Plane has already landed` is shown. 
