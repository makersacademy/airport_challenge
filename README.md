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

-----

To get started require in the relevant files:

```
[1] pry(main)> require './lib/plane.rb'
=> true
[2] pry(main)> require './lib/airport.rb'
=> true
```

and create relevant objects:

```
[3] pry(main)> plane = Plane.new
=> #<Plane:0x00007ff79d0a8b00 @landed=false>
[4] pry(main)> airport = Airport.new
=> #<Airport:0x00007ff79e83bf38 @capacity=10, @planes=[]>
```

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```




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

```
[1] pry(main)> require './lib/plane.rb'
=> true
[2] pry(main)> require './lib/airport.rb'
=> true
[3] pry(main)> plane = Plane.new
=> #<Plane:0x00007ff79d0a8b00 @landed=false>
[4] pry(main)> airport = Airport.new
=> #<Airport:0x00007ff79e83bf38 @capacity=10, @planes=[]>
```

```
[5] pry(main)> airport.land(plane)
=> [#<Plane:0x00007ff79d0a8b00 @landed=false>]
[6] pry(main)> airport
=> #<Airport:0x00007ff79e83bf38 @capacity=10, @planes=[#<Plane:0x00007ff79d0a8b00 @landed=false>]>
[7] pry(main)> plane2 = Plane.new
=> #<Plane:0x00007ff79e859d08 @landed=false>
[8] pry(main)> airport.land(plane)
=> [#<Plane:0x00007ff79d0a8b00 @landed=false>, #<Plane:0x00007ff79d0a8b00 @landed=false>]
[9] pry(main)> airport
=> #<Airport:0x00007ff79e83bf38 @capacity=10, @planes=[#<Plane:0x00007ff79d0a8b00 @landed=false>, #<Plane:0x00007ff79d0a8b00 @landed=false>]>

```

There is 1 in 20 chance of it being stormy and then planes can't land or take off.

```
[10] pry(main)> airport.take_off
RuntimeError: It is too stormy to take off
from /Users/noelvock/Projects/airport_challenge/lib/airport.rb:25:in `take_off'
``



```
