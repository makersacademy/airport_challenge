Airport controller

Control the number of planes at your airport, do not allow planes to take off or land in bad weather.  Do not allow a plane to land if the airport is at maximum capacity.

How it works:

Initialize a new airport with the capacity.  

heathrow = Airport.new(500)

To land a plane:

heathrow.land(Plane.new)

This will give one of three possible outcomes:

Give authorisation to land
Deny if there is bad weather
Deny if the airport is at maximum capacity.

If the plane is authorised to land, the plane will be stored in an array which tells you
the number of planes currently at the airport.

For take off:

heathrow.take_off

This will give one of two possible outcomes:

Give authorisation to take off
Deny if there is bad Weather

If the plane is authorised to take off, the plane will be removed from the array which
tells you the number of planes currently at the airport.

heathrow.planes

This will give a list of the planes currently at the airport.

heathrow.capacity

This will give the number of maximum planes allowed at the airport at one time.
