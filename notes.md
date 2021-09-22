Stories:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

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
```

Class for airport
  instance variables:
  capacity
  landed_planes


  methods:
  current_weather

  has a name/location
  counts aeroplanes in the airport
  has a default capacity
  can check if self is full
  has a weather state?


Class for a plane
  instance variables:
  in_flight = boolean

  methods:
  land
  take_off

  has 2 states, in the air or on the ground
  records which airport it has landed at

