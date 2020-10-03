
Airport challenge
=======================

The airport program allows Airport controllers to instruct planes to land and take off at airports, understand an airports maximum capacity, its current capacity and  to determne whether it is safe to take off or land a plane dependant on the current weather conditions. 



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
Class Airport should exist - Done
Class Plane should exist - Done
method land_plane should exist - Done

2) Instruct plane to take off and confirm no longer at airport
Tests to pass:
method take_off should exists - Done
method in_flight? should exist 



How to use
=============

