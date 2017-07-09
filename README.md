## Airport Challenge


This challenge can be addressed in many different ways. I decided to start designing my solution from the plane. 

So the plane is a main actor. It has knowledge of the airport's API for take-off and landing and can initiate one or another if directed by traffic control (TC). While the airport's job is to provide landings/take-offs and raise errors based on the weather, available capacity and plane's circumstances.

Domain
---------

Objects | Messages
-- | --
Traffic Control  |
Plane  | land_at(airport), lakeoff_from(airport), landed_at?(airport)
Airport | capacity, land(plane), takeoff(plane)
Weather module | stormy?

Plane
---------
Initiates landing or take-off at the specified airport if directed by TC. Procedures require the plane to call the airport's land or takeoff method on self. Also the plane can confirm if it's landed at a specific airport if requested.

Airport
---------
Receives land/takeoff messages from planes. In both cases the plane is passed to the airport's method as an argument. In return the airport may perform landing/take-off procedure or raise an error depending on weather, available capacity and the circumstances of the plane.

Weather
---------
A module included into the airport. Can be asked if it's stormy and return positive on rare occasion. The latter has been proven by scientists who conducted a bunch of highly sophisticated tests.
