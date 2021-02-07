# IAN MCNICHOLAS AIRPORT CHALLENGE #

This is my submission for the airport challenge that was set at the end of week 1 of the Makers Coding Bootcamp.

This project was approached in the same manner as the Boris Bikes project, using the 'airport' similar to the 'docking station', as the centrepiece of the work.

The project has been built and tested using 'rspec' to meet the following user requirements:
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

## User Guide ##

To work the program, the following commands should be used.

Initiate the program in your terminal:
```
irb -r ./lib/airport.rb
```
Instantiate a new airport:
```
airport = Airport.new(capacity)
```
If no capacity is inputted, the airport will be created with a default capacity of 20 planes.  There are initially no planes in the airport.  The probability of stormy weather is 10%.

Where required, instantiate a new plane:
```
plane = Plane.new
```
In order to land a plane in the airport, call the 'land' method on the airport instance, with the plane in question as the argument:
```
airport.land(plane)
```
The 'land' method will return an error if the plane in question is already in the airport, the airport is full to capacity, or the weather is stormy.

In order for a plane to take off from the airport, call the 'take_off' method on the airport instance, with the plane in question as the argument:
```
airport.take_off(plane)
```
The 'plane' method will return an error if the plane in question is not in the airport or the weather is stormy.

To determine if a plane is in the airport, call the 'location' method on the airport instance, with the plane in question as the argument:
```
airport.location(plane)
```

In order to manually change the capacity of the airport at any time, call the 'change_capacity' method on the airport instance, with the new capacity as the argument:
```
airport.change_capacity(new_capacity)
```

In order to ascertain if the weather is stormy at the airport, call the 'stormy?' method on the airport instance:
```
airport.stormy?
```

To see if the airport is full to capacity, call the 'full?' method on the airport instance:
```
airport.full?
```

In order to manually change the probability of bad weather at the airport, call the 'bad_weather_percentage' method on the airport instance, with the new probability of stormy weather inputted as the argument as a percentage:
```
airport.bad_weather_percentage(percentage)
```
