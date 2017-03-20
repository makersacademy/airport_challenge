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
An application used to simulate basic air-traffic controls put in place to land
planes in safe conditions.
The application was written with the logic that the airport should run all landing
checks and, only after clearing a certain plane for take-off or landing, will the plane land.


An example command line run through
➜  airport_challenge git:(master) ✗ pry
::: require "./lib/Airport"
=> true
::: airport = Airport.new
=> #<Airport:0x007f85bf25f0c0 @capacity=20, @landed_planes=[]>
::: plane = Plane.new
=> #<Plane:0x007f85bf1e7b60 @flying=true>
::: airport.commence_landing(plane)
=> "Landed Successfully"
::: airport.commence_take_off(plane)
=> "Take-off Successful"
::: airport.commence_landing(plane)
RuntimeError: Too stormy to land
from /Users/nick/Projects/airport_challenge/lib/Airport.rb:20:in 'clear_landing'
::: airport2 = Airport.new(5)
=> #<Airport:0x007f85bf1943e8 @capacity=5, @landed_planes=[]>
::: 5.times {airport2.commence_landing(Plane.new)}
=> 5
::: airport.commence_take_off(plane)
RuntimeError: Plane already in flight
from /Users/nick/Projects/airport_challenge/lib/Plane.rb:14:in 'take_off'
::: airport2.commence_landing(plane)
RuntimeError: Airport full
from /Users/nick/Projects/airport_challenge/lib/Airport.rb:21:in 'clear_landing'


The following user stories were used to build the Airport and Plane classes as well as a Weather module.
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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.
