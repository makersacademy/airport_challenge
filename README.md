This is my final submission for the Makers Academy Week 1 Challenge

Airport Challenge - Peter Allen
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

User Guide
-----

### Start

To start the program run the following in the terminal:
```
irb -r ./lib/airport.rb
```

### Airports

An airport is created as below. The capacity is an optional argument, if no capacity is supplied the default is set to 10.
```
airport = Airport.new(capacity)
```

The capacity of an airport can be read using the capacity method. This returns an integer.
```
airport.capacity
```

The planes parked at an airport can be read using the parked method. This returns an array of planes.
```
airport.parked
```

A plane can take off from an airport using the takeoff method. The weather is an optional argument that can be supplied as an instance of the weather class to overwrite the default storm probability, see [Weather](#Weather). A plane will only take off if the weather is not stormy. A plane can only take off from an airport it is parked at.
```
airport.takeoff(plane, weather)
```

A plane can land at an airport using the land method. The weather is an optional argument that can be supplied as an instance of the weather class to overwrite the default storm probability, see [Weather](#Weather). A plane will only land if the weather is not stormy. A plane can only land if it is flying already.
```
airport.land(plane, weather)
```

### Planes

A plane is created as below. When a plane is initialised it is set to flying by default.
```
plane = Plane.new(capacity)
```

The status of a plane can be read using the flying method. This returns a boolean.
```
plane.flying
```

### Weather

A Weather instance is created as below. The storm probability is an optional argument between 0 and 1. If no probability is supplied the default is set to 0.2. Each time a plane takes off or lands a new instance of the weather class is generated and checked for stormy conditions.
```
weather = Weather.new(storm_probability)
```

### Error Messages

The following error messages can be raised.

"Can't land, airport full" - The airport is at capacity, so the land method can't be called until a plane has taken off from the airport

"Can't land - The plane is already grounded" - The plane is already grounded, so the land method can't be called until it has taken off

"Can't take off - The plane is not at this airport" - The plane is not parked at the airport takeoff has been called on

"Can't take off - The plane is already flying" - The plane is already flying, so the takeoff method can't be called until it lands

"Can't land, too stormy" - The plane cant land as the weather is currently stormy, the weather is randomly set see [Weather](#Weather)

"Can't take off, too stormy" - The plane cant take off as the weather is currently stormy, the weather is randomly set see [Weather](#Weather)


Testing
-----

The unit tests can be run using the rspec command int eh terminal, and are located in the files:
* ./spec/airport_spec.rb

* ./spec/plane_spec.rb

* ./spec/weather_spec.rb

The tests cover all of the user cases, passing while providing 100% test coverage.
