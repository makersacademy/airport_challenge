As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

```
load './lib/airport.rb'
airport = Airport.new
plane = Plane.new
airport.land(plane) == [plane]
```

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

```
load './lib/airport.rb'
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.takeoff(plane) == plane
airport.hangar == [] # true
```

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

```
load './lib/airport.rb'
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.takeoff(plane) # error
```

          As an air traffic controller
          To ensure safety
          I want to prevent landing when weather is stormy

```
when weather = stormy
airport.land(plane) # error
```

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

```
load './lib/airport.rb'
airport = Airport.new
airport.land(Plane.new)
airport.land(Plane.new) # RuntimeError (Airport full)
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

```
load './lib/airport.rb'
stansted = Airport.new
stansted.capacity == 1
stansted.land(Plane.new)
stansted.land(Plane.new) # RuntimeError (Airport full)
heathrow = Airport.new(50)
heathrow.capacity == 50
50.times { heathrow.land(Plane.new) }
heathrow.land(plane) # Runtime Error (Airport full)
```


Tests to add:

Planes can only take off from airports they are in
Planes that are already flying cannot takeoff
Planes that are already flying cannot be in an airport
Planes that are landed cannot land again
Planes that are landed must be in an airport
