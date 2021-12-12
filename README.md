# GOAL 
Create a script to control airport traffic. The user can:
- command landing & taking off planes 
- check the planes stored in hangar

# How to use:

```
ruby airport.rb
```

# Feature demo:
```
[2] pry(main)> require './lib/airport'
=> true
[3] pry(main)> london_airport = Airport.new
=> #<Airport:0x00007faed7a04fa0 @capacity=3, @hangar=[]>
[4] pry(main)> manchester_airport = Airport.new(1)
=> #<Airport:0x00007faed7a34c50 @capacity=1, @hangar=[]>
[5] pry(main)> plane1 = Plane.new
=> #<Plane:0x00007faed7a47b48>
[6] pry(main)> plane2 = Plane.new
=> #<Plane:0x00007faedb041668>
[7] pry(main)> manchester_airport.land_plane(plane1)
RuntimeError: Permission denied. Stormy weather
from /Users/mateuszdiak/Documents/Projects/airport_challenge/lib/airport.rb:14:in `land_plane'
[8] pry(main)> manchester_airport.land_plane(plane1)
=> [#<Plane:0x00007faed7a47b48>]
[9] pry(main)> manchester_airport.land_plane(plane2)
RuntimeError: Permission not granted. The airport is full.
from /Users/mateuszdiak/Documents/Projects/airport_challenge/lib/airport.rb:15:in `land_plane'
[10] pry(main)> manchester_airport.take_off(plane2)
RuntimeError: Plane not in hangar.
from /Users/mateuszdiak/Documents/Projects/airport_challenge/lib/airport.rb:20:in `take_off'
[11] pry(main)> manchester_airport.take_off(plane1)
=> #<Plane:0x00007faed7a47b48>
[12] pry(main)> manchester_airport.hangar
=> []
[13] pry(main)> 
```

# Features:
- plane cannot land at an airport if it is already in hangar
- plane cannot take off if it is not in the hangar
- an airport can be created with different capacity (3 at default)
- 

# Known issues:
- one plane can be at different airports 

# User stories:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

# Domain model:
![Domain Model Image](/assets/domain_model.jpg)
