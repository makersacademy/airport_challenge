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

Installation Steps
-----
1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`


Planes :airplane:
-----

```ruby
GZBKP = Plane.new("G-ZBKP")

```

This world is so amazing that when a new :airplane: is created it starts flying right away! Imagine a big airplane factory, built inside a giant solar powered structure that just expels airplanes. I'm feeling so Elon Musk :fire:

Althought this might seem amazing, this is this a very organised world.. meaning that creating a Plane requires an argument to be passed, the tail number.

If you are interested in understanding why a plane needs a registration, read [this](https://en.wikipedia.org/wiki/Aircraft_registration)


Airports
-----

```ruby
LHR = Airport.new("LHR", 212)
```

Creating an airport is this easy.. no endless discussions about noise, location or runway extensions. In this example we are creating a new Airport instance. Taking London Heathrow as an example we've used Heathrow's ICAO code (LHR) and a capacity of 212. The [ICAO](https://en.wikipedia.org/wiki/International_Civil_Aviation_Organization_airport_code) code is a required argument and should be passed as a string. The capacity is optional, but in this case i've used [Heathrow's capacity](http://www.heathrow.com/company/company-news-and-information/company-information/facts-and-figures) of 212 to instantiate the object.



## Get planes on ground :parking:

```ruby
LHR.planes_on_ground
```


This instruction will return an array containing the all the planes currently on ground at the airport

## Landing a Plane

```ruby
LHR.land_plane(G-ZBKP)
```
Instructing a plane to land requires one argument (plane)

This instruction will fail if:
- The weather is stormy :zap: :cloud:
- The airport is full :no_entry_sign:
- The plane is on the ground already


## Takeoff a Plane

```ruby
LHR.takeoff_plane(G-ZBKP, LIS)
```

Instructing a plane to takeoff requires two arguments(plane, destination)

This instruction will fail if:
- The weather is stormy :zap: :cloud:
- An invalid destination is provided :globe_with_meridians:


Weather
-----
The weather is handled by the Weather class. At the moment the weather is random and it is checked everytime you run a landing or takeoff instruction. The weather is stormy :zap: :cloud: if the result of the randomizer is 7. Currently the randomizer picks a number between 1 and 7.


Running Example
-----
What to expect from the application when we create two airports (London Heathrow and Lisbon), one plane ([GZBKP](https://www.flightradar24.com/data/aircraft/g-zbkp)) that we 1st instruct to land in Heathrow (remember this is super high tech and planes start their service flying) and then takeoff and land in Lisbon.

```irb
2.4.0 :001 > LHR = Airport.new("LHR")
 => #<Airport:0x007f9af18bd920 @capacity=40, @planes_on_ground=[], @iata_code="LHR", @weather=#<Weather:0x007f9af18bd830>>
2.4.0 :006 > LIS = Airport.new("LIS")
 => #<Airport:0x007f9af28f1440 @capacity=40, @planes_on_ground=[], @iata_code="LIS", @weather=#<Weather:0x007f9af28f1418>>
2.4.0 :002 > GZBKP = Plane.new("G-ZBKP")
 => #<Plane:0x007f9af1055be8 @tail_number="G-ZBKP", @on_ground=false, @location="air">
2.4.0 :003 > LHR.land_plane(GZBKP)
 => [#<Plane:0x007f9af1055be8 @tail_number="G-ZBKP", @on_ground=true, @location="LHR">]
2.4.0 :004 > LHR.planes_on_ground
 => [#<Plane:0x007f9af1055be8 @tail_number="G-ZBKP", @on_ground=true, @location="LHR">]
2.4.0 :005 > GZBKP.location
 => "LHR"
2.4.0 :006 > LHR.takeoff_plane(GZBKP, LIS)
 => #<Plane:0x007f9af1055be8 @tail_number="G-ZBKP", @on_ground=false, @location="air", @destination=#<Airport:0x007f9af28f1440 @capacity=40, @planes_on_ground=[], @iata_code="LIS", @weather=#<Weather:0x007f9af28f1418>>>
2.4.0 :07 > LIS.land_plane(GZBKP)
 => [#<Plane:0x007f9af1055be8 @tail_number="G-ZBKP", @on_ground=true, @location="LIS", @destination=#<Airport:0x007f9af28f1440 @capacity=40, @planes_on_ground=[...], @iata_code="LIS", @weather=#<Weather:0x007f9af28f1418>>>]
2.4.0 :008 > LIS.planes_on_ground
 => [#<Plane:0x007f9af1055be8 @tail_number="G-ZBKP", @on_ground=true, @location="LIS">]
 ```
