Makers Academy Weekend 1: Airport Challenge
=================

Task
---------

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Here are the user stories that we worked out in collaboration with the client:

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

# Installation

- Clone this Repo
- Run ```bundle install``` inside the root of the project
- Run ```IRB``` or ```PRY``` in your terminal
- ```require './lib/airport.rb'```
- Create a new instance of airport with ```airport = Airport.new```
- Create a new instance of plane with ```plane = Plane.new```

## Usage

Where plane is an instance of ```Plane``` and airport is an instance of ```Airport```, the following commands can be used:

- ```airport.land(plane)``` (instruct plane to land at airport)
- ```airport.take_off(plane)``` (instruct plane to take off from airport)
- ```airport.capacity``` (see max airport capacity)
- ```airport.planes``` (see planes docked at airport)
- ```airport.full?``` (see if airport is full)
- ```airport.stormy?``` (see the weather forecast - true is stormy)

```
01:04 pm ~/Programmes/airport_challenge[master] pry
[1] pry(main)> require './lib/airport.rb'
=> true
[2] pry(main)> heathrow = Airport.new
=> #<Airport:0x007fc0e6506be0 @capacity=10, @planes=[], @weather="stormy">
[3] pry(main)> flight101 = Plane.new
=> #<Plane:0x007fc0e64a7820>
[4] pry(main)> heathrow.land(flight101)
RuntimeError: It isn't safe to land.
from /Users/vicky/Programmes/airport_challenge/lib/airport.rb:25:in `land'
```
```
01:11 pm ~/Programmes/airport_challenge[master] pry
[1] pry(main)> require './lib/airport.rb'
=> true
[2] pry(main)> heathrow = Airport.new
=> #<Airport:0x007fc60c3c61b0 @capacity=10, @planes=[], @weather="sunny">
[3] pry(main)> flight101 = Plane.new
=> #<Plane:0x007fc60c31f978>
[4] pry(main)> heathrow.stormy?
=> false
[5] pry(main)> heathrow.land(flight101)
=> [#<Plane:0x007fc60c31f978>]
[6] pry(main)> heathrow.planes
=> [#<Plane:0x007fc60c31f978>]
[7] pry(main)> heathrow.take_off(flight101)
=> nil
[8] pry(main)> heathrow.planes
=> []
[9] pry(main)> heathrow.full?
=> false
[10] pry(main)> genericplane = Plane.new
=> #<Plane:0x007fc60c0de2b8>
[11] pry(main)> 10.times do
[11] pry(main)*   heathrow.land(genericplane)  
[11] pry(main)* end  
=> 10
[12] pry(main)> heathrow.planes
=> [#<Plane:0x007fc60c0de2b8>,
 #<Plane:0x007fc60c0de2b8>,
 #<Plane:0x007fc60c0de2b8>,
 #<Plane:0x007fc60c0de2b8>,
 #<Plane:0x007fc60c0de2b8>,
 #<Plane:0x007fc60c0de2b8>,
 #<Plane:0x007fc60c0de2b8>,
 #<Plane:0x007fc60c0de2b8>,
 #<Plane:0x007fc60c0de2b8>,
 #<Plane:0x007fc60c0de2b8>]
[13] pry(main)> newplane = Plane.new
=> #<Plane:0x007fc60c285288>
[13] pry(main)> heathrow.land(newplane)
RuntimeError: The airport is full, you must wait.
from /Users/vicky/Programmes/airport_challenge/lib/airport.rb:26:in `land'
 ```

# Approach

I approached the challenge by creating three classes:

- Plane
- Airport
- Weather

The user is able to create an instance of a plane and land/take-off the planes at/from the airport.

A plane is unable to land or take-off if the weather is evaluated to stormy. The weather class randomly generates the forecast which is instantiated within the Airport class. If I had more time I would have changed this to be generated upon every take-off or landing.

The maximum capactity for the airport is 10 planes, if there are too many planes at the airport at any given time. No plane will be allowed to land until another has taken off. 

The project was written using TDD, tested using RSpec. The project reports 99% test coverage with Coveralls.
