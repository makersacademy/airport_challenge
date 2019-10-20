##AIRPORT CHALLENGE

1st user story: Completed
*Plane* needs to *land* at an *airport*.

2nd user story: Completed
*Plane* needs to *take off* from an *airport*
and *confirm it is no longer in the airport*

3rd user story: Not completed
*Prevent takeoff* when *weather* is *stormy*

4th user story: Not completed
*Prevent landing* when *weather* is *stormy*

5th user story: Completed
*Prevent landing* when *airport* is *full*

6th user story: Not completed
Give a *default* *airport capacity* that can be *overridden*

Instances of Airport are initialized with 3 attributes:
- An empty array to store the planes (called "planes")
- A default capacity which is currently set at 1
- A weather forecast (instance of Weather.new)

You can call #takeoff on an airport instance to take off a plane.

You can call #land on an airport instance with an instance of Plane.new as an argument to land the plane.

You can call #report on an airport instance to return the current array of planes.

The array "planes" will only fit max 1 plane.

Error is raised if you try to take off a plane when the airport is empty.

Error is raised if you try to land more than 1 plane into the airport.

##PROGRESS

I am having trouble implementing an error which should raise an error message if a plane tries to take off when the weather is stormy. I keep running Rspec and getting different results each times: sometimes all the tests pass, sometimes 1 test fails, sometimes 2 tests fail. I am convinced it's because I haven't properly stubbed the stormy weather environment in the tests - but I am still figuring it out.
