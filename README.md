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

| Objects | Messages |
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

## Development Journal

### Domain model

- Wrote a domain model based on user stories to better understand user stories and map out basic classes and methods.

### User story 1

> As an air traffic controller  
> So I can get passengers to a destination  
> I want to instruct a plane to land at an airport

_There should be a method to land a plane at an airport:_

- Created airport_spec.rb and added describe block for Airport class, required airport.rb. Created airport.rb and added Airport class.
- Wrote test for Airport to respond to land method. Test fails.
- Added empty land method to Airport class. Test passes.

_The method should take a plane as an argument so it knows which plane to land:_

- Wrote test for land to take one argument (the plane to land). Test fails.
- Added parameter (plane) to land method. Test passes.

_The method should return a plane:_

- Wrote test for land to return a Plane instance. Test fails.
- Wrote land method to return Plane.new. Test doesn't know what Plane is. 

_There needs to be planes to land:_

- Created plane.rb and added Plane class. Test passes.

_There should be confirmation of the plane that landed, so return the plane that was landed. In retrospect this test may be unnecessary at this point, as I'm not doing anything with the returned plane yet. Oops!_

- Wrote test for land to return the same Plane instance passed as argument. Test fails.
- Wrote land method to return plane passed in as argument, rather than new Plane instance. Test passes.

### User Story 2

> As an air traffic controller  
> So I can get passengers on the way to their destination  
> I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport  

_There should be a method for planes to take off from the airport:_

- Wrote test for Airport to respond to take_off method. Test fails.
- Added empty take_off method to Airport class. Test passes.

_The take_off method should accept a plane as an argument, which is the plane that will take off:_

- Wrote test for take_off to take one argument (the plane to take off). Test fails.
- Added parameter (plane) to take_off method. Test passes.

_At this point I also created plane_spec.rb and added describe block for Plane class and required plane.rb. Probably jumped the gun on that one._ 

_There should be confirmation that the plane took off so return the plane object. In retrospect this might not be needed right now, as at the moment I'm not doing anything with the returned plane._

- Wrote test for take_off to return a Plane object. Test fails.
- Wrote take_off method to return Plane.new. Test passes.
- Wrote test for take_off to return the same plane as passed as argument. Test fails.
- Wrote take_off method to return the plane passed in as argument. Test passes.

### User Story 3

> As an air traffic controller  
> To ensure safety  
> I want to prevent landing when the airport is full

_The land method should not allow a plane to land if there is already a plane at the airport. In order for this there should be a way to store a landed plane at the airport._ 

- Wrote a test for an airport that has had a plane landed in it. It's hangar method should return the landed plane. Test fails.
- Wrote for the land method to assign a @hangar variable with the plane passed to the land method. Also added at attribute reader for hangar. Test passes.

_I also wrote a test to make sure airports respond to hangar and that hangar returns the stored planes. but it was not really needed as these tests didn't fail before changing code. I guess I got carried away a bit._

_The land method should raise an error if attempting to land a plane when there is already one in the hangar. At the moment it would simply overwrite the existing plane._

- Wrote a test that attempting to land a plane at an occupied airport should raise an error. Test fails.
- Wrote a guard clause in the land method to raise an error if @hangar is truthy (i.e. occupied by a plane). Test passes.

### User Story 4

> As the system designer  
> So that the software can be used for many different airports  
> I would like a default airport capacity that can be overridden as appropriate

_The land method needs to be altered to not check just for one occupant plane, but for several. I decided that the default capacity for the airports should be 5._

- Modified test for landing a plane at an occupied airport. Now when capacity is not set, an airport with 5 planes in @hangar the land method will raise an error when attempting to land another plane. Test fails.
- Initialized the @hangar instance variable as an empty array in the initialize method. Rewrote the guard clause in the land method to check if the size of the @hangar array is 5 (hardcoded), and for the plane to be pushed onto the @hangar array. Test passes.

_Now there needs to be a way to over ride the default capacity._

- Wrote test for a large airport with a custom capacity of 15. The land method should raise an error when attempting to land a 16th plane. Test fails.
- Added an optional parameter to the the initialize method that defaults to a constant DEFAULT_CAPACITY which is set to 5. The parameter is assigned to a @capacity instance variable. This @capacity variable is checked against in the guard clause in land instead of a hardcoded value. Test passes.

_I also updated the hangar tests to reflect the fact that hangar is no longer a single object, but an array. Not needed but the ones I wrote before would not make sense otherwise._


### User Story 6 and 7

_These user stories are both quite similar._

> As an air traffic controller  
> To ensure safety  
> I want to prevent take-off when weather is stormy 

> As an air traffic controller  
> To ensure safety  
> I want to prevent landing when weather is stormy 


_Planes shouldn't take off or land if the weather is stormy. I started with testing the land method._

- Added a context for stormy weather tests.
- Wrote a test for the land method to attempt to land a plane, but raise an error due to stormy weather, and stubbed the airport's stormy? method to return true every time. Test fails.
- Wrote a stormy? method that returns true based on a rand greater than 0.8 to vary the occurrences of storms. Added another guard clause to land to raise an error if stormy? is true. Test passes.

_All the previous tests that relied on land now occasionally fail based on stormy? so I added a different stub for tests outside of the stormy weather tests._

_Planes shouldn't be able to take off in stormy weather either._

- Wrote a test for the land method to attempt to take off with a plane, but raise an error due to stormy weather, and stubbed the airport's stormy? method to return true every time. Test fails.
- Added a guard clause to take_off to raise an error if stormy? is true. Test passes.

_I was also interested in testing the stormy? method itself. I wrote tests for stormy? to return true and false, stubbing the rand method of the object to fixed values in order to guarantee it would always return what was expected. This wasn't needed for the project, but it helped me understand and practice stubbing!_

### Edge cases

Defend against edge cases:
- Planes can only take off from airports they are in
- Planes that are already flying cannot take off and/or be in an airport
- Planes that are landed cannot land again and must be in an airport

_I started by making sure planes that have just landed cannot be landed again. In order to achieve this functionality, I decided to add to the land method so it would update a property of the landing plane to denote that it is no longer flying._

- Wrote a test that the land method marks the plane as not flying, so the plane that landed should not be flying. Test fails.

_The test fails because the Plane class doesn't have a flying? method._

- Added a flying? method to the Plane class, that returns false. The test passes. 

_I also added a test here in plane_spec to check that method as well for completeness._

_Next, the take_off method should mark planes as flying in some way._

- Wrote a test that the take_off method marks the plane as flying, so the plane that just took off should be flying. Test fails.
- Added an instance variable @in_flight to the Plane class, and two methods (lands to set @in_flight to false, and takes_off to set @in_flight to true).
- Added to the Airport land method to call lands on the plane it is landing to set it's @in_flight to false.
- Also added to the Airport take_off method to call takes_of on the plane it is taking off with to set its @in_flight to true. Test passes.

_Next, taking off with a plane from an airport should remove it from the airports hanger._

- Wrote test that a plane that has just taken off from an airport should not appear in it's hangar. Test fails.
- Added to the take_off function to delete the passed plane from the @hanger array. Test passes.

_Now to make sure that planes that aren't flying cannot be landed._

- Wrote test that the land method should raise an error if the plane is not in flight. Test fails.
- Added another guard clause to land method to raise error if the plane is not flying (using the plane flying? method). Test passes.

_Similarly, planes that are already flying cannot take off._

- Wrote a test for the take_off method so it should raise an error if the plane is already in flight. Test fails.
- Added another guard clause to the take_off method to check if the plane is flying? Test passes.

_Also, planes aren't in the hangar can't take off from that airport._

- Wrote a test for the take_off method to raise an error when attempting to take off with a plane that is not in it's hangar.
- Added a third guard clause to the take_off method to check if the plane is included in the hangar array. Test passes.

### Refactoring for SRP

I abstracted out the following parts of methods to their own methods in order to keep methods concise and keep them to a single responsibility:

| Original method | Abstracted code | New method |
|---|---|---|
| take_off(plane) | @hangar.include?(plane) | in_hangar?(plane) |
| land(plane) | @hangar.size == @capacity | hangar_full? |
| land(plane) | @hangar << plane<br>plane | store(plane) |
| land(plane) | plane.flying? | in_flight?(plane) |
| take_off(plane) | @hangar.delete(plane) | remove(plane) |
| take_off(plane) | raise 'Cannot take off planes that are already in flight' if in_flight?(plane)<br>raise 'Cannot take off. Weather is stormy.' if stormy?<br>raise 'This plane is not in the hangar.' unless in_hangar?(plane) | preflight_checks(plane) |
| land(plane) | raise 'Cannot land planes that are not in flight' unless in_flight?<br>in_flight?<br>raise 'Cannot land. Weather is stormy.' if stormy?<br>raise 'Hangar full.' if hangar_full? | landing_checks(plane) |
| take_off(plane) | remove(plane)	<br>plane.takes_off<br>plane | take_off_sequence(plane) |
| land(plane) | plane.lands<br>store(plane) | landing_sequence(plane) |