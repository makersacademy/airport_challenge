
Airport challenge
=======================

The airport program allows Airport controllers to:
  * Instruct planes to land and take off at airports, 
  * Understand an airports maximum capacity and its current capacity 
  * Determne whether it is safe to take off or land a plane dependant on the current weather conditions. 



Domain model


Objects            | Messages                                                                 |
===================|:========================================================================:|
AirportController  |                                                                          |
Passengers         |                                                                          |           
Planes             |                                                                          |
Airport            | land_plane, take_off, confirm_no_longer_at_airport, airport_full?,       |
                   | airport_capacity, weather                                                |
SystemDesigner     |                                                                          |



Tests
=======

1) requirement: Instruct plane to land at an aiport
Tests to pass: 
* Class Airport should exist - Done
* Class Plane should exist - Done
  method land(plane) should exist - Done

2) Instruct plane to take off and confirm no longer at airport
Tests to pass:
* method take_off should exists - Done
* method in_flight? should exist  - Done

3) Prevent planes landing when airport is full
Tests to pass
* method land(plane) should exist - Done
* land(plane) should error if full - Done

4) Airports should have a default capacity that can be overridden. Default capacity for testing will be 20.
Tests to pass
* airport should be able to land(plane) 20 times - done
* airport should raise an error after 20 planes have   landed.  - done

5) when a plane takes off it should:
  i) be removed from the aiport
  ii) have its flight status updated
tests to pass:
 * plane should have a flight status - done
 * flight status should be true after take_off  - done
 * flight status should be false after land - done
 * Airport methods take_off should remove plane from   airport and update plane flight status
 * Airport method  land should update the plane instance variable in_flight?

6) Prevent take off when weather is stormy
tests to pass:
* create a storms? method  - done
* update take off and land to use storms? - done

7) airport should only allow take off of planes that have landed at airport
test
* an error should be raised if you attempt to take off a plane that isnt in the airport



