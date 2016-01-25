Airport Project

Overview
---
  This project was intended as an overview of the weeks work, for us to take everything we have learnt and apply it.
  
Plane Class:
---
  - Contains the functionality of a plane, allowing it to take off and land at certain airports as well as check if it is flying or not. 
  - Flying planes can not take-off and grounded planes can not land.

Airport Class:
---
 - Starts off with no planes and a capacity based on the airports size. 
 - Landing planes adds the plane to the airport and taking-off removes it. 
 - The weather is checked before a plane can land or take off, to ensure it is safe to do so. 
 - Planes are not able to land if the airport has reached it's maximum capacity.


Build status:
---
  https://travis-ci.org/tcpickard94/airport_challenge.svg?branch=master


Instructions:
---

```
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fda13120c38 @planes=[], @capacity=15> 
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fda1310ae38 @flying=false> 
2.2.3 :006 > plane.take_off(airport)
 => "Plane has taken off!!" 
2.2.3 :007 > plane.land(airport)
 => "Plane has touched down!!" 
 ```