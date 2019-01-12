
Edge cases
- Random number generator to set the weather - Done
- Stub to override random whether for tests - Done (I think!)
- Planes should only take off from airports they're in - Done
- Planes already flying cannot take off - Done
- Planes already flying cannot be in an airport - Done by implication?
- Planes that are landed cannot land again - Done
- Planes that are landed must be in an airport - Done by implication?



NB - Consider land/takeoff methods on airport, not ATC?
Consider returning an array of planes when the land method called
Consider returning the plane when takeoff. 


plane = double('a plane')

Feature test (in rspec) -> unit test (in rspec) -> fail -> pass -> refactor (loop) --> pass feature test --> refactor -> repeat

subfolders in spec folder:
features
units 
