Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(__G-ZKIH__)
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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.


Installation Steps
-----
1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`


Planes :airplane:
-----

```ruby
GZKIH = Plane.new("G-ZKIH")

```

Creating a Plane requires an argument to be passed, the tail number. It is flying when it is created.



Airports
-----

```ruby
LGW = Airport.new("LGW", 100)
```

 Creating an Airport, the [ICAO](https://en.wikipedia.org/wiki/International_Civil_Aviation_Organization_airport_code) code is a required argument and should be passed as a string, while the capacity is an optional argument (a default of 60 planes will otherwise be used) and should be passed as an integer. Taking London Gatwick as an example I've used Gatwick's ICAO code (LGW) and a capacity of 100.



## Get planes on ground :parking:

```ruby
LGW.planes_on_ground
```

This instruction will return an array containing all the planes currently on the ground at the airport


## Landing a Plane

```ruby
LGW.land_plane(G-ZKIH)
```
Instructing a plane to land requires one argument (plane)

This instruction will fail if:
- The weather is stormy :zap: :cloud:
- The airport is full :no_entry_sign:
- The plane is on the ground already


## Plane Takeoff

```ruby
LGW.takeoff_plane(G-ZKIH, FLR)
```

Instructing a plane to takeoff requires two arguments (plane, destination)

This instruction will fail if:
- The weather is stormy :zap: :cloud:
- An invalid destination is provided :globe_with_meridians:
- The plane is not on the ground


Weather
-----
The weather is handled by the Weather class. At the moment the weather is random and it is checked everytime you run a landing or takeoff instruction. The weather is stormy :zap: :cloud: if the result of the randomizer is 7. Currently the randomizer picks a number between 1 and 7.


Running example
-----
What to expect from the application when we create two airports (London Gatwick and Florence), one plane (GZKIH) and when we instruct that plane to land in London Gatwick and then takeoff and land in Florence.

```
$ cd airport_challenge

$ pry
[1] pry(main)> require './lib/airport.rb'
=> true
[2] pry(main)> LGW = Airport.new("LGW", 100)
=> #<Airport:0x007f8e39ab3938
 @capacity=100,
 @iata_code="LGW",
 @planes_on_ground=[],
 @weather=#<Weather:0x007f8e39ab3910>>
[3] pry(main)> FLR = Airport.new("FLR")
=> #<Airport:0x007f8e39a71b00
 @capacity=60,
 @iata_code="FLR",
 @planes_on_ground=[],
 @weather=#<Weather:0x007f8e39a71ad8>>
[4] pry(main)> GZKIH = Plane.new("G-ZKIH")
=> #<Plane:0x007f8e39a293a0
 @location="air",
 @on_ground=false,
 @tail_number="G-ZKIH">
[5] pry(main)> LGW.land_plane(GZKIH)
=> [#<Plane:0x007f8e39a293a0
  @location="LGW",
  @on_ground=true,
  @tail_number="G-ZKIH">]
[6] pry(main)> LGW.planes_on_ground
=> [#<Plane:0x007f8e39a293a0
  @location="LGW",
  @on_ground=true,
  @tail_number="G-ZKIH">]
[7] pry(main)> GZKIH.location
=> "LGW"
[8] pry(main)> LGW.takeoff_plane(GZKIH, FLR)
=> #<Plane:0x007f8e39a293a0
 @destination=
  #<Airport:0x007f8e39a71b00
   @capacity=60,
   @iata_code="FLR",
   @planes_on_ground=[],
   @weather=#<Weather:0x007f8e39a71ad8>>,
 @location="air",
 @on_ground=false,
 @tail_number="G-ZKIH">
[9] pry(main)> FLR.land_plane(GZKIH)
=> [#<Plane:0x007f8e39a293a0
  @destination=
   #<Airport:0x007f8e39a71b00
    @capacity=60,
    @iata_code="FLR",
    @planes_on_ground=[...],
    @weather=#<Weather:0x007f8e39a71ad8>>,
  @location="FLR",
  @on_ground=true,
  @tail_number="G-ZKIH">]
[10] pry(main)> FLR.planes_on_ground
=> [#<Plane:0x007f8e39a293a0
  @destination=
   #<Airport:0x007f8e39a71b00
    @capacity=60,
    @iata_code="FLR",
    @planes_on_ground=[...],
    @weather=#<Weather:0x007f8e39a71ad8>>,
  @location="FLR",
  @on_ground=true,
  @tail_number="G-ZKIH">]
 ```
