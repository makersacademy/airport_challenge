Airport Challenge
=================
This is a simple app that allows planes to land and takeoff from an airport.

Classes
---------
- Plane - This class instantiates a plane object with an instance variable @flying which is initial set as flying assuming planes are in the air until landing at an airport.

- Airport - The airport class contains methods that deal with the landing and taking off of plane objects.

Airport
-------
- An airport initializes with an empty plane array to store planes and a default capacity (20).
- THe land and takeoff methods set the plane variable flying to false and true respectively so that the attr_accessor flying can be called on a plane object to determine whether is is currently in an airport or in the air.
- Both land and takeoff methods contain guards against the edge cases of landing and taking off in stormy weather and also only landing / taking off if the plane is already flying/landed.
- The land method also guards against planes landed while the airport is at maximum capacity. This is determined by the method full.
- The stormy? method outputs true with 10% probability and is used for testing weather conditions within the land and takeoff methods.


-----
