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

Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Complete the following task:

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

Basic functionality for user stories complete, functionality demonstrated in irb below:

```
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > plane = Plane.new
 => #<Plane:0x007f865b07fa10 @flying=true>
2.2.3 :003 > airport = Airport.new
 => #<Airport:0x007f865b075060 @capacity=10, @planes=[]>
2.2.3 :004 > plane_two = Plane.new
 => #<Plane:0x007f865b067028 @flying=true>
2.2.3 :005 > airport.land(plane_two)
 => [#<Plane:0x007f865b067028 @flying=false>]
2.2.3 :006 > airport
 => #<Airport:0x007f865b075060 @capacity=10, @planes=[#<Plane:0x007f865b067028 @flying=false>]>
2.2.3 :007 > airport.land(plane)
 => [#<Plane:0x007f865b067028 @flying=false>, #<Plane:0x007f865b07fa10 @flying=false>]
2.2.3 :008 > airport
 => #<Airport:0x007f865b075060 @capacity=10, @planes=[#<Plane:0x007f865b067028 @flying=false>, #<Plane:0x007f865b07fa10 @flying=false>]>
2.2.3 :009 > airport.take_off(plane_two)
 => #<Plane:0x007f865b067028 @flying=true>
2.2.3 :010 > plane
 => #<Plane:0x007f865b07fa10 @flying=false>
2.2.3 :011 > plane_two
 => #<Plane:0x007f865b067028 @flying=true>
2.2.3 :012 > airport
 => #<Airport:0x007f865b075060 @capacity=10, @planes=[#<Plane:0x007f865b07fa10 @flying=false>]>
```

I completed the challenge through first determining the scope of user stories and then writing tests that would check this functionality.

Looking through the code review rubric, there are a number of changes that could be made to the code to improve - however, I was limited with time and chose to focus on core requirements.

Key improvements:
* Weather class - This is currently a bit of a hack and would limit expanding the scope of the program.

* Testing for "non-planes" - I haven't required a check on the object being landed at the airport. 
