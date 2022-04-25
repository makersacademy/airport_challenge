Airport Challenge
=================
The program simulates the control flow of planes at an airport. Planes can land and take off, provided there is no storm.

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


Walkthrough
---------

Please see below a walkthrough of the steps


Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`


Instructions
----------

**Getting Started**
Navigate to the project directory and start a new IRB requiring the `airport.rb` file:

```
laura@Lauras-Air airport_challenge % irb -r ./lib/airport.rb
3.0.2 :001 > airport = Airport.new
 => #<Airport:0x000000015b145e68 @capacity=3, @planes_at_airport=[]> 
3.0.2 :002 > plane = Plane.new
 => #<Plane:0x000000014e027ea8> 

```

**The Airport**
The default airport capacity is 3 planes. Use `planes_at_airport` method to see the planes currently stored at the airport.

```
laura@Lauras-Air airport_challenge % irb -r ./lib/airport.rb
3.0.2 :001 > airport = Airport.new
 => #<Airport:0x000000015b145e68 @capacity=3, @planes_at_airport=[]> 
3.0.2 :002 > plane = Plane.new
 => #<Plane:0x000000014e027ea8> 
3.0.2 :003 > airport.planes_at_airport
 => [] 
3.0.2 :004 > 

```

**The Planes**
Use `land` and `take_off` to navigate the planes.

```
laura@Lauras-Air airport_challenge % irb -r ./lib/airport.rb
3.0.2 :001 > airport = Airport.new
 => #<Airport:0x000000012f026658 @capacity=3, @planes_at_airport=[]> 
3.0.2 :002 > plane = Plane.new
 => #<Plane:0x000000014ea29ca8> 
3.0.2 :003 > airport.planes_at_airport
 => [] 
3.0.2 :004 > airport.land(plane)
 => "#<Plane:0x000000014eb22998> has landed" 
3.0.2 :005 > airport.land(plane)
 => "#<Plane:0x000000014ea2b5f8> has landed" 
3.0.2 :006 > airport.take_off(plane)
 => "#<Plane:0x000000014ea2b5f8> has taken off" 
3.0.2 :007 > airport.land(plane)
 => "#<Plane:0x000000012f82d568> has landed" 
3.0.2 :008 > airport.planes_at_airport
 => [#<Plane:0x000000014eb22998>, #<Plane:0x000000012f82d568>] 

```

Testing
-----

**User Stories**

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

**Edge Cases**

* ensuring planes can only take off from airports they are in
* planes that are already flying cannot take off and/or be in an airport
* planes that are landed cannot land again and must be in an airport, etc.

**Running Tests**

Tests were run using RSpec (installed as per instructions above),
to run tests:

```
cd navigate/to/airport_challenge

rspec
```

Thoughts
-----
The program is not finished, methods should be shorter and could be re-organised, tests could be restructured and organised.