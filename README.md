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
Installation Steps
-----
1. Clone this repo to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`


Task
-----
First airplane weekend challenge at Makers Academy requires to implement control flow of planes at the airports based on the following user stories:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent take off when weather is stormy

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

Objectives
----------

- To consolidate our understanding of Object Orientated Programming
- Improve on TDD implementation


Technologies
------------
- Ruby
- RSpec

Remaining implementation
----------------------

To finish all of the requirements for this challenge, edge cases for the airport still need to be tested, in order to defend against inconsistent states of our system. To accomplish this task - plane class needs functionality to know more about the state of the planes. I'm looking to finish the task in my spare time.

Example
----------
```
$ pry
pry(main)> load "./airport.rb"
=> true
pry(main)> airport = Airport.new
#<Airport:0x007fb35995e368 @capacity=50, @planes=[]>
pry(main)> plane = Plane.new
=> #<Plane:0x007fb35924cf20>
pry(main)> plane1 = Plane.new
=> #<Plane:0x007fb35981eb38>
pry(main)> airport.land(plane)
RuntimeError: It's stormy! You can't land right now
pry(main)> airport.land(plane)
=> [#<Plane:0x007fb35924cf20>]
pry(main)> airport.land(plane1)
=> [#<Plane:0x007fb35924cf20>, #<Plane:0x007fb35981eb38>]
pry(main)> airport.planes
=> [#<Plane:0x007fb35924cf20>, #<Plane:0x007fb35981eb38>]
pry(main)> airport.take_off
RuntimeError: It's stormy! We can't fly
pry(main)> airport.take_off
=> #<Plane:0x007fb35981eb38>
pry(main)> airport.take_off
=> #<Plane:0x007fb35924cf20>
pry(main)> airport.take_off
RuntimeError: No planes in the airport
pry(main)>
```
