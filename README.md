Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(__MRYOO7__)
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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

Solution
-----

I started off with by writing test spec for a Plane class (and then by implementing the class), as I assumed the plane would start off flying. I created methods inside Plane: land and take_off, which act to update the current location of the plane, and I have implemented edge cases to ensure a plane behaves as should (see above).

I then wrote and built upon test spec and code for an Airport class, which has functions arrive and depart that send a message to an instance of Plane to say it's okay to take off/land. Airport also has a stormy? method and an optional parameter for storm_probability. Planes can't take off if stormy? is true.

Example Usage
-----

```ruby
require './lib/plane'
require './lib/airport'

mry007  = Plane.new
#=> #<Plane:0x007f95f201f858 @airport=nil>
lhw     = Airport.new(capacity: 100, storm_probability: 50) # Airport takes optional parameters through a Hash object
#=> #<Airport:0x007f95f209e158 @planes=[], @storm_probability=50, @capacity=100>
sxf     = Airport.new
#=> #<Airport:0x007f95f2094b80 @planes=[], @storm_probability=10, @capacity=20> 

lhw.arrive(mry007)
#=> RuntimeError: Plane can't land due to stormy weather.
lhw.arrive(mry007)
#=> #<Plane:0x007f95f201f858 @airport=#<Airport:0x007f95f209e158 @planes=[#<Plane:0x007f95f201f858 ...>], @storm_probability=50, @capacity=100>>
lhw.depart(mry007)
#=> RuntimeError: Plane can't take off due to stormy weather
lhw.depart(mry007)
#=> #<Plane:0x007f95f201f858 @airport=nil> 
sxf.arrive(mry007)
#=> #<Plane:0x007f95f201f858 @airport=#<Airport:0x007f95f2094b80 @planes=[#<Plane:0x007f95f201f858 ...>], @storm_probability=10, @capacity=20>> 
```
