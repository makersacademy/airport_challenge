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

Instructions
-----

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

To land at an airport do:

```
[5] pry(main)> airport.land(plane)

```

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

Instruct a plane to take off:

```
[6] pry(main)> airport.take_off
=> #<Plane:0x00007f95be01aee0 @landed=false>
```

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

If there is stormy weather take off won't be allowed.

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

If there is stormy weather take off won't be allowed.

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

Capacity default is 10 but this can be changed at initialization or later with:

```
[7] pry(main)> airport
=> #<Airport:0x00007f95be2ebf20 @capacity=10, @planes=[]>
[8] pry(main)> airport.capacity
=> 10
```

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

```
[9] pry(main)> airport.capacity = 5
=> 5
[10] pry(main)> airport
=> #<Airport:0x00007f95be2ebf20 @capacity=5, @planes=[]>
```



There is 1 in 20 chance of it being stormy and then planes can't land or take off.

```
[10] pry(main)> airport.take_off
RuntimeError: It is too stormy to take off
from /Users/noelvock/Projects/airport_challenge/lib/airport.rb:25:in `take_off'
```
