# Airport

[Source](https://github.com/makersacademy/airport_challenge)

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

## User stories

> As an air traffic controller   
> So I can get passengers to a destination  
> I want to instruct a plane to land at an airport  

> As an air traffic controller  
> So I can get passengers on the way to their destination  
> I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport  

> As an air traffic controller  
> To ensure safety  
> I want to prevent landing when the airport is full 

> As the system designer  
> So that the software can be used for many different airports  
> I would like a default airport capacity that can be overridden as appropriate

> As an air traffic controller  
> To ensure safety  
> I want to prevent take-off when weather is stormy 

> As an air traffic controller  
> To ensure safety  
> I want to prevent landing when weather is stormy 

## Technical Requirements

Separate files for every class, module and test suite.

Use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy).  
Use a stub to override random weather to ensure consistent test behaviour.

Defend against edge cases:
- Planes can only take off from airports they are in
- Planes that are already flying cannot take off and/or be in an airport
- Planes that are landed cannot land again and must be in an airport

## Domain Model

| **Objects** | **Messages** |
|---|---|
| Air Traffic Controller |  |
| System Designer |  |
| Airport | **#land(plane)** - only if Airport is not full, weather is not stormy, and plane is flying <br>**#take_off(plane)** - confirms it is no longer in airport, only if weather is not stormy, and plane is not flying <br>**#stormy?** - 0.2 chance to return true, otherwise false <br><br>**@capacity** - capacity of @hangar, defaults to 5 <br>**@hangar** - array for storing planes  |
| Plane | **#lands** - updates @in_flight to false <br> **#takes_off** - updates @in_flight to true <br><br>  **@in_flight** - boolean describing if plane is in flight |

## Instructions

### Enter REPL

- Enter your REPL of choice, I use IRB.  
  From terminal in the main directory: 
  
  ```ruby
  irb
  ```

- Load in airport.rb:
  
  ```ruby
  require './lib/airport.rb'
  ```

### Instantiate objects

- Instantiate a Plane: 
  ```ruby
  my_plane = Plane.new
  ```

- Instantiate an Airport: 
  ```ruby
  my_airport = Airport.new
  ```

- The default parameter for an airport's hangar capacity is 5. If you would like to set a custom capacity pass a number as an argument when instantiating:
  ```ruby
  large_airport = Airport.new(15)
  ```


### Landing at an Airport

- Land your plane at your airport with the Airport land method: 
  ```ruby
  my_airport.land(my_plane)
  ```

- You may find that the weather is stormy at the airport, in which case you will receive an error:
  
  > RuntimeError (Cannot land. Weather is stormy.)  

  Keep trying, it won't be stormy every time you try to take off.

- You will only be able to land if there is space in the hangar for your plane. If the hangar is full you will receive an error:

  > RuntimeError (Hangar full.)

  Another plane will have to take off before you can land.

- You won't be able to land if your plane is currently landed:
  ```ruby
  my_airport.land(landed_plane)
  ```

  > RuntimeError (Cannot land planes that are not in flight.)

### Taking off from an an Airport

- Take off in your plane from airport with the Airport land method: 
  ```ruby
  my_airport.take_off(my_plane)
  ```

- You may find that the weather is stormy at the airport, in which case you will receive an error:
  
  > RuntimeError (Cannot take off. Weather is stormy.)  

  As with landing, keep trying, it won't be stormy every time you try to take off.

- You won't be able to take off from an airport in a plane that doesn't exist in that airport's hangar.
  ```ruby
  my_airport.take_off(plane_landed_elsewhere)
  ```

  > RuntimeError (This plane is not in the hangar.)

