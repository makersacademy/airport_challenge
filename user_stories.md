As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

object | message |result
-------|---------|--------
plane  | #land   |plane will land at the airport

-----

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

object | message   |result
-------|-----------|--------
airport| #take_off |plane takes off && is no longer in the airport after take off

-----

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

object | message   |result
-------|-----------|--------
airport| stormy?   |plane doesn't take off if the weather is stormy

-----

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

object | message |result
-------|---------|--------
airport| stormy? |plane doesn't land if the weather is stormy

-----

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

object | message |result
-------|---------|--------
airport| !#land   |plane will will not land if the airport is full

-----

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

object | message |result
-------|---------|--------
airport| capacity|change default capacity
