# Air Traffic Controller

## Commands for AirTraffic class

- `AirTraffic.interrogate(plane)` this requests the location of the specified plane.

- `AirTraffic.land(plane, airport)` this commands a plane to land at a specified airport and returns two things; the location output `String` and returns the `in_flight` variable, which should be `false`.

- `AirTraffic.takeoff(plane, destination_airport)` this commands a plane to take off and sets the destination of that plane to the specified airport, the airport arguement can be left blank and the plane will keep any previously assigned destination (ie. from creation). 
