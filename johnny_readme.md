The project consists of 3 classes:

+weather - random weather condition generator
+plane - plane objects contain flying status (boolean) and basic method set to change the status
+airport - allows to land a plane using `.land (plane, weather)`, the plane must be in the air, and weather object must be provided as 2nd parameter.
`.take_off (plane, weather)` allows to take off, plane must be at the airport and cannot be in the air already.
new instances of the airport have limited capacity (default 35), which can be changed using `Airport.new(capacity). `
Flights during stormy weather are forbidden (taking off and landing), with 1:10 chances of stormy weather.  

***USER STORIES***

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
*TESTED*

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
*TESTED*

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
*TESTED*

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
*TESTED*

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
*TESTED*

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
*TESTED*

***additional requirements/edge cases***

ensuring that planes can only take off from airports they are in
*TESTED*

planes that are already flying cannot takes off and/or be in an airport
*TESTED*

planes that are landed cannot land again and must be in an airport
*TESTED*
