Airport Challenge - Partial Solution

To do:

Write test to check that users can overwrite the maximum capcity.

Planes cannot land at multple airports.

Refactor (Rubocop).

Create own WeatherGenerator class (SRP) and relevant changes.

=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)


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
This program simulates the landing and taking off of planes at an airport.

Weather has an 80% chance of being sunny and 20% chance of being stormy each time a plane attempts to land/take off.

Planes cannot land/take off in stormy weather.

Airports are initialized with default capacity of 20. This can be overwritten upon creation of a new airport object, or at any moment with the overwrite_capacity method called on an airport object.

Planes cannot land when airport capacity is at full.

Planes that take off are removed from the airport bay.

Only one plane can land/take off at any one moment.


