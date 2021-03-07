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
Task
-----
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
This code simulates an airport. Airports can be created, as can planes. Weather is automatically simulated as sunny or stormy. The weather is stormy 30% of the time.
Example use (all files need to be required in order for the program to work):
```
# Create an airport
airport1 = Airport.new
=> #<Airport:0x00007fd5d61d00e8 @capacity=20, @name="airport", @planes_at_airport=[], @weather=#<Weather:0x00007fd5d61d0020 @forecast="sunny">>
# Create planes
2.6.5 :007 > plane1 = Plane.new
=> #<Plane:0x00007fd5d60b7260 @location="In the air">
2.6.5 :008 > plane2 = Plane.new
=> #<Plane:0x00007fd5d6149c28 @location="In the air">
# Change the capacity of the airport
2.6.5 :010 > airport1.change_capacity(3)
=> 3
# Land the plane at the airport
2.6.5 :011 > airport1.land(plane1)
=> "airport"
# Retrieve a list of planes at the airport
2.6.5 :012 > airport1.plane_list
=> [#<Plane:0x00007fd5d60b7260 @location="airport">]
2.6.5 :013 > airport1.land(plane2)
=> "airport"
2.6.5 :014 > plane3 = Plane.new
=> #<Plane:0x00007fd5d609c2d0 @location="In the air">
2.6.5 :015 > plane4 = Plane.new
=> #<Plane:0x00007fd5d6122470 @location="In the air">
2.6.5 :016 > airport1.land(plane3)
=> "airport"
# Can't land a plane if the airport is full
2.6.5 :017 > airport1.land(plane4)
Traceback (most recent call last):
       5: from /Users/lou/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
       4: from /Users/lou/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
       3: from /Users/lou/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
       2: from (irb):17
       1: from /Users/lou/Library/Mobile Documents/com~apple~CloudDocs/Projects/Makers-Work/Week1/airport_challenge/lib/airport.rb:33:in `land'
RuntimeError (Airport Full)
# Take off a plane from the airport
2.6.5 :018 > airport1.take_off(plane1)
=> "In the air"
# Plane is no longer at the airport
2.6.5 :019 > airport1.plane_list
=> [#<Plane:0x00007fd5d6149c28 @location="airport">, #<Plane:0x00007fd5d609c2d0 @location="airport">]
