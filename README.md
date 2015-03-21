Airport Challenge
=================

Use
---



Approach:
---------

There are two classes, Airport and Plane. You can call 'land' on an instance of Airport, pass in an instance of plane as a parameter, to land a plane. The same for 'take-off'.

Weather is decided by a random number inside the Airport class. The Airport class takes an optional settings hash on initialization which may contain a 'climate' value. This determines how likely a storm is, with '0' meaning no storms and the higher the number the more likely they are. The default is 1, which gives a probality of storms at 1 / 6.

The number of terminals in the airport may also be controlled by the settings hash.

Airports raise errors when a plane tries to land at a full airport, a plane tries to land or take off when it's stormy, and when a plane that isn't in the airport tries to take-off.