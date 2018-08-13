Airport Challenge
=================

This projects simulates airport traffic control. Airport capacity can be overwritten and weather can vary. Planes can land and take off from an airport, if capacity allows and weather permitting. 

Using my decision tree, I input the 6 user stories provided and followed the TDD approach. 

```
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
```

### Features

The plane can land and take off from an airport if the weather is sunny
A plane cannot land if it is already in the airport
A plane cannot take off, if it is not in the airport
The airport capacity can be overwritten


It can be run in command line as follows:

```
irb
2.5.0 :001 > require './lib/airport'
 => true 
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007fc80810e6e0 @planes=[], @capacity=50, @weather=#<Weather:0x00007fc80810e6b8>> 
2.5.0 :003 > plane = Plane.new("EK123")
 => #<Plane:0x00007fc808104a00 @flight_no="EK123"> 
2.5.0 :004 > airport.plane_land(plane)
 => "EK123 has landed" 
2.5.0 :005 > 

```

