As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

Class airport
method land

.land = airport + 1 plane

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

class plane
method  status
class airport
method take_off

airport => takeoff => airport -1 plane && plane.status = away

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

if airport.capcity is full => land = error

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

class airport
capacity = 20

override => set capacity

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

class airport
attr weather 

if weather == stormy take_off = error