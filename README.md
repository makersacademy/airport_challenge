Airport Challenge (by Xin Wang)
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

This is a program that can control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Airports are created with a default capacity of 100 which can be overridden if required. Here are the user stories that we worked out in collaboration with the client:

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

## Installation
1. Install or use Ruby 2.4.0
2. Fork this repo, and clone to your local machine
3. Run the command `gem install bundle` (if you don't have bundle already)
4. When the installation completes, run `bundle`

This program defends against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

## How to run this program in irb
$ irb
2.4.0 :001 > require './lib/airport.rb'
 => true
2.4.0 :002 > airport = Airport.new
 => #<Airport:0x007f964f158028 @planes=[], @capacity=100>
2.4.0 :003 > require './lib/plane.rb'
 => true
2.4.0 :004 > plane = Plane.new
 => #<Plane:0x007f964f141738 @flying=true>


## Steps Taken

1. Using TDD to generate feature tests and unit tests, followed by writing code
   (using red-green-refactor process)
2. Writing additional tests to ensure programme defends against edge cases and
   refactoring accordingly
3. Isolating unit tests and stubbing behaviour shared across no. of tests
4. Stub randomness of stormy weather generator to prevent random test failure
5. Refactoring code again
6. Check the code against code review rubrics
