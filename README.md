Airport Challenge
=================

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

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

Approach
-----

I approached the challenge by creating three modules:
- Plane
- Airport
- Weather

The user is able to create instances of plane and airport, and then proceed to land/take-off the planes at/from the given airports.

I initially understood the challenge to only require one airport. For that reason, I created Weather such that no instances of it are required, it is a class module only. Since weather is generated randomly, and is not saved, it didn't think it was necessary to have it based on creating instances. Once I understood the challenge required multiple airports I did consider changing this, but even if weather instances were used, it would still be generated randomly and the functionality would be the same. However, it would be good for the system to be able to report the weather at a given location (i.e. as a future user story).

All of the 
