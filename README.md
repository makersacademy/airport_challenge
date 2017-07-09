## Airport Challenge


This challenge can be addressed in many different ways. I decided to start designing it from the plane. 

So the plane has a knowledge of the airport API for take-off and landing and can initiate one or another if directed by traffic control (TC). While the airport's job is to provide landings/take-offs, raise errors based on the weather and available capacity and to count planes and watch the available capacity.

Domain
---------

Objects | Messages
-- | --
Traffic Control  |
Plane  | land_at(airport), lakeoff_from(airport), landed_at?(airport)
Airport | capacity, land(plane), takeoff(plane)
Weather | stormy?

Plane
---------
Initiates landing or take-off if directed by TC.
Procedures require the plane to call the airport land or takeoff method on self.

Airport
---------
Receves land/takeoff messages from planes. In return it may perform landing/take-off or raise an error depending on weather, available capacity and the circumstances of the plane .

Weather
---------
A module included into the airport. Can be asked if it's stormy and return positive on rare occasion. The latter has been proven by scientists after conducting a bunch of highly sophisticated tests.
