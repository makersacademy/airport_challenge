## User Stories ##

As an air traffic controller:
- I want to instruct a plane to land at an airport
- I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
- I want to prevent takeoff when weather is stormy
- I want to prevent landing when weather is stormy
- I want to prevent landing when the airport is full

As the system designer
- I would like a default airport capacity that can be overridden as appropriate

### Edge Cases ###
Edge Cases such as:
- inconsistent states of the system ensuring that planes can only take off from airports they are in;
-planes that are already flying cannot takes off and/or be in an airport;
-planes that are landed cannot land again and must be in airport
