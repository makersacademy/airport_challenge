# Airport Challenge

### Completed by Marek Schmidt
#### Instructions below

## User Stories:
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
```

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
```

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
```

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
```

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
```

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

## How to use

1. Run IRB `IRB`

2. Require the proper files `require './lib/airport'`, `require './lib/plane'`

3. Set up at least one airport  
  * Optional name and capacity parameters can be passed
  ```
  gatwick = Airport.new('Gatwick', 30)
  ```
  * If no parameters are passed, the name will default to 'airport' and the capacity will default to 20
  ```
  my_airport = Airport.new
  ```  

4. Airplanes can also be named by passing the name as an optional parameter
  ```
  boeing = Plane.new("Boeing 747")
  ```  
  * If no name is passed, the name will default to 'airplane'
  ```
  my_plane = Plane.new
  ```

5. There are two ways to land a plane  
  * Call the land method on an airport and pass the plane as an argument
  ```
  gatwick.land(boeing)
  ```
  * Call the land method on a plane and pass the airport as an argument
  ```
  boeing.land(gatwick)
  ```

6. There are three ways to make a plane take off  
  * Call the take_off method on a plane object by it's name in memory
  ```
  boeing.take_off
  ```  
  * Call the take_off method on an airport and pass a plane object by it's name in memory
  ```
  gatwick.take_off(boeing)
  ```
  * Call the take_off_by_name method on an airport and pass a plane's assigned name as a string
  ```
  gatwick.take_off_by_name("Boeing 747")
  ```
    * This third method is useful when many planes were landed at once but never assigned to a name in memory, such as with `10.times {gatwick.land(Plane.new)}`  
    * In this case, `gatwick.take_off_by_name('airplane')` will remove one plane from Gatwick  

7. There are two ways to check a plane's current airport  
  * Call the airport method to receive the airport as an object
  ```
  boeing.airport
  ```  
  * Call the airport_name method to receive just the airport's name (if it has one)
  ```
  boeing.airport_name
  ```  
  * When a plane is in the air, it's airport will be _nil_  

8. There are two ways to check an airport's current list of planes  
  * Call the planes method to get a long array of all plane objects
  ```
  gatwick.planes
  ```  
  * Call the planes_by_name method to print a string containing the names of all planes currently at the airport
  ```
  gatwick.planes_by_name
  ```

### Each time a plane attempts to either take off or land at an airport, there is a 10% chance that the weather will be too stormy to safely allow the action, and an error will be given

### If an airport is at capacity, an error will be given when attempting to land an additional plane
