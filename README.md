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

description
------------

This is a simple program for air traffic controllers. It is designed to simulate the taking off and landings of planes at an airport, with barrier conditions like bad weather prevents landing and take off, and landing prevented when airport is full. The code was written to follow a set of user stories below and it was test driven at a feature and a unit test level.

Planning and structure
----------------------

The program was split into two main objects the plane and the airport. As this program was intended for use by an air traffic controller, the take off and land methods belong to the airport object taking an instance of the plane object as an argument. I also decided to model the weather state as a private method on the airport class using a random number generator.

Using the program
-----------------

clone the project and then cd into it and then run RSpec to see the passing tests

```
Airport
  #land
    when not stormy
      instructs a plane to land
      when full
        raises an error
    when stormy
      raises an error
  #take_off
    when not stormy
      instructs a plane to take off
    when stormy
      raises an error

user_stories
  when not stormy
    so planes land at airports, instruct a plane to land
    so planes take off from airports, instruct a plane to take off
    when airport is full
      does not allow planes to land
  when weather is stormy
    does not allow planes to land
    does not allow planes to take off

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.00993 seconds (files took 0.13277 seconds to load)
10 examples, 0 failures


COVERAGE:  98.51% -- 66/67 lines in 5 files

+----------+----------------+-------+--------+---------+
| coverage | file           | lines | missed | missing |
+----------+----------------+-------+--------+---------+
|  93.33%  | lib/airport.rb | 15    | 1      | 41      |
+----------+----------------+-------+--------+---------+
4 file(s) with 100% coverage not shown

```


example of simple usage in the teminal using pry or irb

```
[1] pry(main)> require "./lib/airport.rb"
=> true
[2] pry(main)> require "./lib/plane.rb"
=> true
[3] pry(main)> jfk = Airport.new(20)
=> #<Airport:0x00007f99e9225378 @capacity=20, @planes=[]>
[4] pry(main)> plane1 = Plane.new
=> #<Plane:0x00007f99e9154ca0>
[5] pry(main)> jfk.land(plane1)
RuntimeError: Cannot land plane: weather is stormy
```



Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

User stories
------------

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

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


Test coverage and code formatting
---------------------------------

Rubocop
Simplecov


Project file structure
----------------------

```
.
├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── LICENSE
├── README.md
├── Rakefile
├── coverage
├── docs
│   └── review.md
├── lib
│   ├── airport.rb
│   └── plane.rb
└── spec
    ├── airport_spec.rb
    ├── features
    │   └── user_stories_spec.rb
    ├── plane_spec.rb
    └── spec_helper.rb

```
