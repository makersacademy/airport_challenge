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

Background
---------

* This is the first weekend challenge I was set to follow up the learning of week 1 at Makers Academy. (RSpec testing, OO Programming, RSpec mocks and doubles, single responsibility principle)


How to use
-------

* Use ruby version 2.5.0

```
irb -r './lib/plane.rb'

```

Sample output

---------

```

Matts-MBP:airport_challenge mattburgoyne$ irb -r './lib/plane.rb'
2.5.0 :001 > gatwick = Airport.new
 => #<Airport:0x00007fe756017fa8 @planes_in_airport=[], @capacity=10, @weather=#<Weather:0x00007fe756017f30 @weather="stormy">>
2.5.0 :002 > emirates_a380 = Plane.new
 => #<Plane:0x00007fe75602c980 @plane_landed=nil>
2.5.0 :003 > emirates_a380.land_plane(gatwick)
 => #<Airport:0x00007fe756017fa8 @planes_in_airport=[#<Plane:0x00007fe75602c980 @plane_landed=true, @current_airport=#<Airport:0x00007fe756017fa8 ...>>], @capacity=10, @weather=#<Weather:0x00007fe756017f30 @weather="stormy">>
2.5.0 :004 > emirates_a380.takeoff(gatwick)
Plane has left the airport => nil

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

My approach
-----

I started by sketching out a domain model to help identify the objects in the program and the messages they would need to respond too.

Drawing the domain model helped me to come to the decision to make the weather a separate object since I wanted the airport to only serve the purpose of housing planes. However an instance of the airport class does have an accompanying weather condition parameter.

I then wrote unit tests for the objects in my domain model, using doubles where appropriate to ensure behaviour was what I expected from the program.

After unit tests where written I wrote feature tests for interactions between the objects in the program, these were guided by the user stories provided by the client.

Features were tested regularly in irb as I went along.

Lastly I added the edge cases to my test files, (e.g plane not allowed to leave an airport during bad weather).

I tried to refactor my methods as I went along to ensure each had a single clear responsibility.
