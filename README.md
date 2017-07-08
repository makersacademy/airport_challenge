## Airport Challenge


This challenge can be implemented in many ways. I decided to design it from the plane. So the plane is a main actor. 

The plane lands itself to the specified airport or take-off from it if granted clearance. While the airport's job is to allow landings/take-offs based on the weather and available capacity.

Domain
---------

Objects | Messages
-- | --
Traffic Control  |
Plane  | land_at(airport), lakeoff_from(airport), landed?(airport)
Airport | capacity, landing_clear?, takeoff_clear?, plane_arrived(plane), plane_left(plane)
Weather | stormy?

Plane
---------
Initiates landing or take-off if directed by TC.

Procedures includes requests to the airport for clearance and, if clearance is given, informing the airport of the fact of arrival or departure.

Airport
---------
Receves landing/take-off clearance requests. May grant the clearance or raise an error depending on weather and available spaces.

Weather
---------
A module included into the airport. Can be asked if it's stormy and return positive on rare occasion. The latter has been proven by scientists after conducting a bunch of sophisticated tests.
