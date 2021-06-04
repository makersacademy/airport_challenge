### Planning & diagramming

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport 
```

Requirements:
- Classes: Plane, Airport
- Method: land(plane)

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport 
```

Requirements:
- Classes: Plane, Airport
- Method: take_off(plane)

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

Requirements:
- Classes: Plane, Airport
- Variable: @capacity
- Methods: full? (check if @planes.size >= @capacity)

``` 
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate 
```

Requirements:
- Classes: Plane, Airport
- Variable: @capacity (test capacity other than the default(50))

``` 
As an air traffic controller
to ensure safety
I want to prevent takeoff when weather is stormy
```

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

Requirements:
- Classes: Plane, Airport
- Variable: @weather
- Methods: weather_report, land, take_off (raise errors if landing or departing during stormy weather)

*** Use a stub to override random weather to ensure consistent test behavior. Use a test double to test random weather.

### Edge cases

- Defend inconsistent states of the system ensuring that planes can only take off from airports they are in

- Ensure planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport.

### Bonus

- Run an RSpec feature test that lands and takes off a number of planes.
