Airport Challenge
=================

Updated README

My approach to the challenges was to create three classes, Airport, Plane and Weather to implement the functionality described in the user stories. All three classes need to be instantiated on running the program in IRB

The Airport Class has a default capacity, initially set at 20 but which can be overwritten by the set_capacity method. When the capacity of planes has been reached, an error message will be returned. The Airport can land and takeoff planes, both methods taking a plane and weather object as arguments. Landing a plane includes it in the airport, and changes the state of the plane.

The Plane Class can also land and takeoff planes, taking an Airport and Weather objects as arguments. Landing a plane adds it to the airport specified, and confirms that the plane is landed. Taking off removes a plane from the Airport, and changes the state of the plane. A plane knows which airport it is landed in. Planes cannot take off from airports in which they are not landed, and cannot takeoff if they are not in any airport.

The Weather Class will occasionally be stormy, but mostly it will be fine. If the weather is stormy, planes can neither land or takeoff.

As landing and taking off are shared behaviours across the Plane and Airport classes, these methods have been extracted to a module - TakeoffLand, which are included in the wrapped methods in each class.
