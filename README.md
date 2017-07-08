## Airport Challenge


This challenge can be addressed in many different ways. I decided to design it from the plane. So the plane is a main actor.

The plane lands itself to the specified airport or takes-off from it, if granted clearance. While the airport's job is to allow landings/take-offs based on the weather and available capacity.

Domain
---------

Objects | Messages
-- | --
Traffic Control  |
Plane  | land_at(airport), lakeoff_from(airport), landed_at?(airport)
Airport | capacity, landing_clear?, takeoff_clear?, checkin(plane), checkout(plane)
Weather | stormy?

Plane
---------
Initiates landing or take-off if directed by traffic control (TC).

Procedures includes requests to the airport for clearance and, if the clearance is given, informing the airport about the fact of the arrival or departure.

Airport
---------
Receves landing/take-off clearance requests. In return it may grant the clearance or raise an error depending on weather and available spaces.

Weather
---------
A module included into the airport. Can be asked if it's stormy and return positive on rare occasion. The latter has been proven by scientists after conducting a bunch of highly sophisticated tests.
