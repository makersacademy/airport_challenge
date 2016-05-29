# Airport Challenge

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

## Task

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

## Progress

- Decided what to name my classes!
```
weather = Weather.new
airport = Airport.new(capacity, weather)
plane = Plane.new
```

- There is a 1 in 5 chance of a storm
```
weather.stormy?
```

- Airport can instruct a plane to land as long as the weather is good
- Airport raises an error if there is no space left
```
airport.land_plane(plane)
```

- Airport confirms that plane has landed
```
airport.docked?(plane)
```

- Airport can instruct a plane to take off as long as the weather is good.
- Airport raises an error if the plane instructed to take off doesn't exist at the airport
```
airport.take_off(plane)
```

- An airport can have a specific max capacity if required, otherwise it's just instantiated with a default capacity
```
airport_default = Airport.new
airport_large = Airport.new(100)
```
