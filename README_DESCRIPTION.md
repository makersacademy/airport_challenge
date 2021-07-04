# Airport Challenge
## What is it?
A model of how a controlled system would allow planes to fly and take off from an airport.
## How much completed
Satisfied the user stories that were worked out in collaboration with the client. Did not implement the fact that planes can only take off from airports that they are stationed at.
## Assumptions
Assumed that when an airport object is created the user can not override the weather attached to the airport. There is a 10% chance that the airport will be stormy, meaning that planes can not land or fly from it. The remaining 90% of the time it will be sunny and is fully operational. The default airport capacity is 5 if no parameter is specified.

When plane objects are created they are defaulted to be grounded at a given location (airport name). Planes can be created with the option of being in the air and there will be no location if this is the case.
