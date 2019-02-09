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
---
- At first, I took each user story and created a domain model, then mapped-out the relationship between each object and their messages.
- Next, I fired-up IRB and ran some feature tests to help drive my test-writing
- With each fialing feature test, I wrote a unit test with RSpec which is designed to fail at first (RED)
- With a RED RSpec test in-hand, I wrote the bare-minimum of code necessary to make this test pass (GREEN)
- Then I refactored the code to make it as lean and relevant as possible without sacrificing readability (REFACTOR)
- Finally, I ran the feature test again with IRB to watch the feature pass
- I used Rubocop to keep my code nice and pretty

How to Use
---

Begin by requiring the necessary Ruby source code files. Once included, you can create Aiport and Plane objects and try to land(a_plane) or takeoff(a_plane) as below:
```
irb -r ./lib/airport.rb -r ./lib/plane.rb
2.5.3 :001 > heathrow = Airport.new
 => #<Airport:0x00007fc4aa892bc0 @hangar=[], @capacity=5> 
2.5.3 :002 > blackbird = Plane.new
 => #<Plane:0x00007fc4ab1b57c0> 
2.5.3 :003 > heathrow.land(blackbird)
 => [#<Plane:0x00007fc4ab1b57c0>] 
2.5.3 :004 > heathrow.takeoff(blackbird)
Traceback (most recent call last):
        3: from /Users/andrew/.rvm/rubies/ruby-2.5.3/bin/irb:11:in `<main>'
        2: from (irb):4
        1: from /Users/andrew/Projects/airport_challenge/lib/airport.rb:21:in `takeoff'
RuntimeError (Cannot take-off; weather is stormy)
2.5.3 :005 > heathrow.takeoff(blackbird)
 => #<Plane:0x00007fc4ab1b57c0> 
2.5.3 :006 >
```
Airport objects respond to:

- land (takes a plane object)
- takeoff (takes a plane object)

The weather at any airport is sunny 80% of the time and planes can land and take-off without any problems. 20% of the time, a storm occurs and planes will be grounded (see demo above)