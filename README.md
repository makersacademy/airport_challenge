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
#### Technologies: Ruby, Rspec
Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

### USER STORIES

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

### Instructions

In command line, type the following to run the program:
```
irb
2.4.0 :001 > require './lib/airport.rb'
 => true

2.4.0 :002 > airport = Airport.new
 => #<Airport:0x007ff8631573f0 @planes=[], @capacity=20, @weather=true>

2.4.0 :003 > plane = Plane.new
 => #<Plane:0x007ff86314f0d8 @landed=true>

2.4.0 :004 > airport.land(plane)

2.4.0 :004 > airport.take_off(plane)

```
The user can specify a capacity for the airport by typing:

```
2.4.0 :002 > airport = Airport.new(50)

```

### Train of Thought
```
Create Unit and Feature Tests using TDD

Use the Red, Green, Refactor method to pass individual Unit and Feature Tests

First tackle landing and taking off of planes

Check to see if planes have left the airport if they have taken off

Check to see if planes that are in the air are not present in the airport array of planes

Add default capacity to the airport

Allow the user to pass a custom capacity as an argument

Check to see if the tests still pass if the capacity is increased

Set the weather to be good enough to land by default to avoid random cases of stormy weather

Add the weather randomizer as a last step and test the code in Unit and Feature Tests

Use doubles to simulate plane and weather behaviour

Refactor the code to remove extra lines where possible and mock the behavior of the methods

```

