As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

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

- Random number generator to set the weather
- Stub to override random whether for tests
- Planes should only take off from airports they're in
- Planes already flying cannot take off
- Planes already flying cannot be in an airport
- Planes that are landed cannot land again
- Planes that are landed must be in an airport



NB - Consider land/takeoff methods on airport, not ATC?
Consider returning an array of planes when the land method called
Consider returning the plane when takeoff. 


plane = double('a plane')

Feature test (in rspec) -> unit test (in rspec) -> fail -> pass -> refactor (loop) --> pass feature test --> refactor -> repeat

subfolders in spec folder:
features
units 
