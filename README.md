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

## Introduction

I undertook this project in order to help me better understand the principles of object oriented programming and test-driven development (TDD).

This program controls the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories provided beforehand:

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
## Approach

In order to solve this, I took a four step approach:

1. **Domain modelling:** mapping out each noun (or object) and verb (or message) in each of the user stories. This allowed me to understand which classes I needed to create and the methods I would need to create so that I could move into feature testing.

2. **Feature tests:** running the program through a REPL (in this case Pry), so that I was able to see errors and write unit tests accordingly.
3. **Unit tests:** writing tests (or expectations) in Rspec to show the expected functionality of each particular method and watching these fail straight away. These are located in the spec folder.
4. **Red-green-refactor:** writing code to make each individual unit test pass, refactoring my code to make it more readable and less verbose.

## How to run this program
### Installing this program
- Fork and clone this project onto your machine.
- Change directory (or CD) into the directory where this project is saved.
- Launch your REPL (irb or Pry - I'm using Pry here)

### Running this program
Make sure you require the airport file and then create a new instance of the Airport and Plane classes:

```
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007f9498a4a6f8
 @capacity=20,
 @planes=[],
 @weather=#<Weather:0x007f9498a4a6a8>>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007f9498a033c0 @landed=false>
```

Here you can see that we have an airport with no plane inside along with a capacity and an instance of the weather class, and a plane which has not yet landed.

- Try to land the plane
- Notice how sometimes the plane cannot land because of bad weather:

```
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007fa894429480
 @capacity=20,
 @planes=[],
 @weather=#<Weather:0x007fa894429458>>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007fa8943d8698 @landed=false>
[4] pry(main)> airport.land(plane)
RuntimeError: This plane is already landed.
```


But most of the time, it will land just fine:

```
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007fa894429480
 @capacity=20,
 @planes=[],
 @weather=#<Weather:0x007fa894429458>>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007fa8943d8698 @landed=false>
[4] pry(main)> airport.land(plane)
=> [#<Plane:0x007fa8943d8698 @landed=true>]
```

You'll notice that the plane is now marked as landed.

Now try getting the plane to take off:

```
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007fb77b285890
 @capacity=20,
 @planes=[],
 @weather=#<Weather:0x007fb77b285868>>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007fb77b246848 @landed=false>
[4] pry(main)> airport.land(plane)
=> [#<Plane:0x007fb77b246848 @landed=true>]
[5] pry(main)> airport.take_off(plane)
=> #<Plane:0x007fb77b246848 @landed=false>
```

And it works! It is no longer marked as landed. Watch out for bad weather though:
```
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007fb77b285890
 @capacity=20,
 @planes=[],
 @weather=#<Weather:0x007fb77b285868>>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007fb77b246848 @landed=false>
[4] pry(main)> airport.land(plane)
=> [#<Plane:0x007fb77b246848 @landed=true>]
[5] pry(main)> airport.take_off(plane)
RuntimeError: Bad weather today. Cannot take off.
```

Try getting the plane to take off again:

```
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007f82d1abdde8
 @capacity=20,
 @planes=[],
 @weather=#<Weather:0x007f82d1abdd98>>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007f82d1a75e80 @landed=false>
[4] pry(main)> airport.land(plane)
=> [#<Plane:0x007f82d1a75e80 @landed=true>]
[5] pry(main)> airport.take_off(plane)
=> #<Plane:0x007f82d1a75e80 @landed=false>
[6] pry(main)> airport.take_off(plane)
RuntimeError: That plane is not in this airport
```

As you can see, an error is raised because the plane is no longer there. If we do the reverse, see what happens:

```
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007fb77b285890
 @capacity=20,
 @planes=[],
 @weather=#<Weather:0x007fb77b285868>>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007fb77b246848 @landed=false>
[4] pry(main)> airport.land(plane)
=> [#<Plane:0x007fb77b246848 @landed=true>]
[5] pry(main)> airport.land(plane)
RuntimeError: This plane is already landed.
```

Again, an error is raised saying that this plane has already landed.

This airport doesn't have unlimited space, though. Normally it has a capacity of 20, but we can also override this:

```
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007f8e75bdfed8
 @capacity=20,
 @planes=[],
 @weather=#<Weather:0x007f8e75bdfeb0>>
[3] pry(main)> airport.change_capacity(3)
=> 3
```

What happens when we try to put more planes in there than there are spaces? Let's create a bunch of planes and try to land them all:

```
[4] pry(main)> plane1 = Plane.new
=> #<Plane:0x007f8e75b2fbc8 @landed=false>
[5] pry(main)> plane2 = Plane.new
=> #<Plane:0x007f8e75af7868 @landed=false>
[6] pry(main)> plane3 = Plane.new
=> #<Plane:0x007f8e75ab6a48 @landed=false>
[7] pry(main)> plane4 = Plane.new
=> #<Plane:0x007f8e758ed0e0 @landed=false>
[8] pry(main)> airport.land(plane1)
=> [#<Plane:0x007f8e75b2fbc8 @landed=true>]
[10] pry(main)> airport.land(plane2)
=> [#<Plane:0x007f8e75b2fbc8 @landed=true>,
 #<Plane:0x007f8e75af7868 @landed=true>]
[11] pry(main)> airport.land(plane3)
=> [#<Plane:0x007f8e75b2fbc8 @landed=true>,
 #<Plane:0x007f8e75af7868 @landed=true>,
 #<Plane:0x007f8e75ab6a48 @landed=true>]
[14] pry(main)> airport.land(plane4)
RuntimeError: Sorry. Airport full. Go away.
```

It doesn't allow you to land more planes than there are spaces!
