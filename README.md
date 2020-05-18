# Airport Challenge

## Summary of Challenge
- Create an airport and plane
- Instruct the plane to land and take off from the airport and have the airport respectively store and remove the plane from the airport hangar
- Have the airport have a default capacity value that can be overridden
- Have an error raised when a plane tries to land in an airport when the hangar is at full capacity
- Have a weather system that is mostly sunny but occasionally stormy
- Have an error raised when a plane tries to take off or land when the weather is stormy
- Have errors raised to prevent inconsistencies such as a plane attempting a take off whilst already in flight

## Approach to Challenge

Broadly speaking the process I went through to solving the challenge was:

- For each user story:
  1. Create a feature test for how the user flow should look when all the code has been correctly implement
  2. Run the feature test in IRB and take note of the first error that appears
  3. Create an Rspec unit test around that error and run to failure
  4. Implement code until unit test passes
  5. Go back to step 2 and repeat the process until the feature test passes
- Isolate Rspec files from each other using Doubles
- Implement Mocks in order to mimic certain conditions (e.g. the weather always being sunny) in order for certain tests to consistently pass

## User Stories

```bash
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
## Specific Issues I Encountered

- One of the first tasks I worked on was deciding what the overall architecture of the code might look like. I was initially unsure of whether the `land` and `take_off` methods should be a part of the `Airport` class or `Plane` class. That is to say: should it be the airport that decides to land the plane, or the plane that decides to land at the airport. In terms of code implementation, it would seem to make more sense for the methods to be part of the `Airport` class as what constitutes a take off and landing (the addition and removal of the plane from the `hangar` array) happens entirely within the `Airport` class. However, I instead opted to have the methods be a part of the `Plane` class as, from a user perspective, it did not seem very intuitive for an `airport.land` command to be run. The modification of the `hangar` array is instead done through the airport’s `request_landing` and `request_take_off` methods which are called from within the plane’s `land` and `take_off` methods.
- A similar issue arose when deciding which tests would take place where. Again, it would make more intuitive sense for “take off” and “land” related tests to take place in the `plane_spec.rb` file; seeing as it is the plane the would be instructed to take off or land. However, for the reasons stated above, a “take off” or “land” test would not be testing the `Plane` class’ ability to take off and land, but rather Rspec’s ability to mimic the behavior of the `Airport` class (assuming all spec files are isolated from each other). Therefore, these tests were placed in the `airport_spec.rb` file relating to the `request_landing` and `request_take_off` methods.
- After still coming to grips with the Single-responsibility Principle (SRP), I made an effort to keep each method short and specific, but was still unsure of how much each method should be discretised. I was aware of instances where methods seemed like they could be further divided into smaller and more specific methods, but where doing so also seemed unnecessary and would only add further complexity. Further research and experience will be required to be more comfortable with this concept.

## Usage
### Creating a Plane and Airport
```
heathrow = Airport.new
 => #<Airport:0x00007fa42693d3f8 @capacity=20, @hangar=[], @weather="sunny">
BA123 = Plane.new
 => #<Plane:0x00007fa4060343a8 @location="in_flight">
```
### Landing and Taking Off a Plane
```
BA123.land(heathrow)
 => #<Airport:0x00007fa42693d3f8 @capacity=20, @hangar=[#<Plane:0x00007fa4060343a8 @location=#<Airport:0x00007fa42693d3f8 ...>, @airport=#<Airport:0x00007fa42693d3f8 ...>>], @weather="sunny">
BA123.take_off
[plane has taken off from airport]
 => ""
 ```
### Setting Airport Capacity
```
heathrow
=> #<Airport:0x00007fb0d401d088 @capacity=20, @hangar=[], @weather="sunny">
heathrow.capacity = 45
=> 45
heathrow
=> #<Airport:0x00007fb0d401d088 @capacity=45, @hangar=[], @weather="sunny">
 ```
### Preventing Plane from Landing at a Full Airport
```
heathrow.capacity.times { |a_plane| a_plane = Plane.new ; a_plane.land(heathrow) }
 => 45
BA123.land(heathrow)
Traceback (most recent call last):
        3: ...
        2: ...
        1: ...
RuntimeError (Airport is at maximum capacity)
```
### Preventing Plane from Landing During Stormy Weather
```
heathrow
 => #<Airport:0x00007ff380898520 @capacity=20, @hangar=[], @weather="stormy">
BA123.land(heathrow)
Traceback (most recent call last):
        3: ...
        2: ...
        1: ...
RuntimeError (Weather conditions are too unsafe)
```
### Preventing Plane from Taking Off During Stormy Weather
```
heathrow
=> #<Airport:0x00007ff380881960 @capacity=20, @hangar=[#<Plane:0x00007ff38005c528 @location=#<Airport:0x00007ff380881960 ...>, @airport=#<Airport:0x00007ff380881960 ...>>], @weather="stormy">
BA123.take_off
Traceback (most recent call last):
        3: ...
        2: ...
        1: ...
RuntimeError (Weather conditions are too unsafe)
```
### Preventing Take Off and Landing Inconsistencies 
```
BA123.land(heathrow)
 => #<Airport:0x00007ff8e9810828 @capacity=20, @hangar=[#<Plane:0x00007ff9298af258 @location=#<Airport:0x00007ff8e9810828 ...>, @airport=#<Airport:0x00007ff8e9810828 ...>>], @weather="sunny">
BA123.land(heathrow)
Traceback (most recent call last):
        3: ...
        2: ...
        1: ...
RuntimeError (Plane has already landed)
BA123.take_off
[plane has taken off from airport]
 => ""
BA123.take_off
Traceback (most recent call last):
        3: ...
        2: ...
        1: ...
RuntimeError (Plane is already in flight)
```
