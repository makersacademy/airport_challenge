# Domain models for user stories

## Story 1

Object            Methods
--------------------------
ATC
Passenger
Destination

Plane             
Airport           land

Airports handle landing the plane so both objects are decoupled.
Planes focus on being planes, airports focus on their landing and stuff



## Story 2

Object            Methods
--------------------------
Airport             take_off, in_airport?

Perhaps Plane shouldn't handle in_airport?


## Story 3

Object            Methods
--------------------------
Airport           full?




land/take_off

plane
plane_1, plane_2,...
[plane_1, plane_2,...]