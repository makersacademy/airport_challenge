### Airport Challenge

This is an airport!
You can create a new airport with your own weather and capacity, or leave them as the default, then land and take off planes from it, depending only on the weather and capacity.

#Commands

1. "Airport.new(weather, capacity)" will create a new airport and set your weather parameter as the weather state, and capacity as the maximum number of planes which can land at the airport. Both have defaults if left blank.
2. "Plane.new" will create a new plane which can land at your airport.
3. "airport_name.land(plane)" will land the plane you pass as an argument at the airport.
4. "airport_name.takeoff(plane)" will take off the most recently landed plane.
5. "Weather.new" will create a new weather object with a random weather state which can be passed to the Airport.new method as a parameter
