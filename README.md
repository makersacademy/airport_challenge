Airport Challenge
=================

This challenge was completed using TDD. The unit tests were written in RSpec (and isolated using doubles) and the feature tests were performed in `irb`.

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
 
#### This software controls the flow of planes at an airport
- The planes can land and take off provided that the weather is clear. 
- Occasionally, it is stormy and no planes can land or take off.
- A plane cannot land if the airport is full.
- A plane cannot take off from an airport that it isn't in.
- A plane cannot take off if it is already flying.
- A plane cannot land if it isn't in the air.

## Instructions
When using `irb`, after loading the lib files, the user can interact with the program by following the notes below:

### Creating the objects:

**Plane**:
```
plane = Plane.new
```

**Weather generator**:
```
weather_generator = WeatherGenerator.new(Random.new)
```
- The `weather_generator` object needs to be fed an instance of the Random class in order to randomly generate weather.

**Airport**:
```
airport = Airport.new(weather_generator, [], 100)
```

- The `airport` object needs to be fed a `weather_generator` object in order to know whether it is clear or stormy.
- The second argument is the list of `plane`s currently stored on the `airport`, which will default to an empty list if not specified.
- The third argument is the capacity of the `airport` which will default to 100 unless specified.

### Landing a plane:
```
plane.land(airport)
```

### Take off:
```
plane.take_off(airport)
```

### Checking if it is stormy:
```
airport.stormy?
```
- This will return `true` if it is stormy and `false` if it is clear.

### Confirming that the plane is flying:
```
plane.flying?
=> true
```

### Checking the airport's capacity:
```
airport.capacity
 => 100
 ```
 
### Changing the airport's capacity:
```
airport.change_capacity(50)
airport.capacity
=> 50
```
