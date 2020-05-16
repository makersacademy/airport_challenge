Airport Challenge
=================
### Summary of the Challenge
=================
### Story 1
As an air traffic controller\
So I can get passengers to a destination\
I want to instruct a plane to land at an airport

| Object | Message |
| --- | ----------- |
| Air traffic controller  | instruct |
| Plane                   | land |
| Airport                 |      |

Air traffic controller --instruct--> Plane\
Plane --land--> Airport

Feature test:\
plane = Plane.new\
airport = Airport.new\
airport.planes #shows that airport is empty\
=> []\
plane.land(airport) #plane instructed to land\
airport.planes #shows that plane has landed\
=> [plane_object]

=================
### Story 2
As an air traffic controller\
So I can get passengers on the way to their destination\
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

| Object | Message |
| --- | ----------- |
| Air traffic controller  | instruct |
| Plane                   | take_off |
| Airport                 |      |

Air traffic controller --instruct--> Plane\
Plane --take_off--> Airport

Feature test:\
plane = Plane.new\
airport = Airport.new\
plane.land #plane instructed to land\
airport.planes #shows that plane has landed\
=> [plane_object]
plane.take_off
=> Confirmation that plane is no longer at airport
airport.planes #confirms that plane is no longer at airport\
=> []
