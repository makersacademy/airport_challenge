## Airport Challenge
### Oleg Lukyanov | Week 1 | Weekend

Approach
---------

I decided to start designing my system from the plane. In my imaginary world the planes receives messages from TC and then communicate with the airport in order to secure landings/take-offs and inform the airport of their arrivals and departures.

Domain
---------

Objects | Messages
-- | --
Traffic Control  |
Plane  | land_at(airport), lakeoff_from(airport), landed?(airport)
Airport | capacity, landing_clear?, takeoff_clear?, plane_arrived(plane), plane_left(plane)
