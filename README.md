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

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

Approach
-----
I worked through each user story one at a time, starting with a simple program for the first, and ending with a more complex one by the end of the final user story. For each story, I tried to do the following:

1. Create a domain model to represent the objects and messages
2. Perform a manual feature test in irb
3. Write a unit test in spec file
4. Make the test pass
5. Refactor
6. Continue from Step 2 until user story is complete

After finishing the user stories, I have attempted to refactor my code, and organise my tests in a logical way.

Note: The code is not fully refactored (e.g. plane_spec.rb does not use mocking), but at this stage I'm unsure how to refactor further.


To run program
-----
In irb, enter the following:
`require ./lib/airport.rb`

Example irb output:

```
$ irb
2.4.1 :001 > require './lib/airport.rb'
 => true
2.4.1 :002 > airport = Airport.new
 => #<Airport:0x007fa8f5054740 @planes=[], @weather=#<Weather:0x007fa8f5054718>, @capacity=5>
2.4.1 :003 > airport.weather.stormy?
 => false
2.4.1 :004 > plane = Plane.new
 => #<Plane:0x007fa8f684d298 @status="In air">
2.4.1 :005 > airport.land(plane)
 => [#<Plane:0x007fa8f684d298 @status="At airport">]
2.4.1 :006 > airport.take_off(plane)
 => #<Plane:0x007fa8f684d298 @status="In air">
2.4.1 :007 > plane.status
 => "In air"
```
