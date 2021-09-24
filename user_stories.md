As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

1. Airport should respond to the land command
2. Land command should take a variable
3. Land command should create a new plane

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

1. Airport should respond to the instruction takeoff
2. Takeoff should respond to confirm plane is no longer in the airport

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

| Objects | Messages |
|-|-|
| Air Traffic Controller | |
| Passengers | |
| Destination? | |
| Airport | land, take off, status, capacity, safe? |
| System designer | |
| Plane |