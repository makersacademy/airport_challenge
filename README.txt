Airport challenge - Weekend of the 23rd and 24th January 2016

After reviewing user stories I decided the central linking object would be the Air traffic controller. This would interact with an Airport, Plane and Weather class to undertake the desired actions. 

Air traffic controller:
. instruct plane to land
. instruct plane to take off
. confirm if plane is in flight
. confirm if plane is in airport
. confirm if weather is stormy and prevent takeoff and landing if so.
. confirm if airport is full and prevent landing if so

Airport:
. have a default capacity that can be altered on initialisation.
. have a list of landed planes that it can provide a copy of to air traffic controller
. be full


Plane:
. be landed
. be in flight


Weather:
. be stormy at random
. else be fine


ADDITIONAL - 
.Ensure that a landed plane raises error if attempt is made to land it
.Ensure that a plane in flight raises an error if attempt is made to take off
.Ensure a plane cannot take off from an airport it is not at.