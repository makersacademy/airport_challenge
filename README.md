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
airport.planes\
=> []\
plane.land\
airport.planes\
=> [plane_object]\

=================
