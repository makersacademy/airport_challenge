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


Planes
-----

```ruby
G-ZBKP = Plane.new("G-ZBKP")

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


## Get planes on ground

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
- The weather is stormy
- The airport is full


## Takeoff a Plane

```ruby
LHR.takeoff_plane(G-ZBKP, LIS)
```

Instructing a plane to takeoff requires two arguments(plane, destination)

This instruction will fail if:
- The weather is stormy
- An invalid destination is provided