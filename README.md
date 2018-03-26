Airport Challenge
=================

Consists of two classes - Plane and Airport- and a Weather module. 

User can instruct a Plane instance to land at/ take off from a specific airport by sending it a method with the airport as
a parameter. Program will then check whether the plane instance is in an appropriate state- landed or in air. If this is true,
a message will be sent to the airport to request landing/taking off. Airport has a Weather module included that generates
random weather with 1/10 of a chance for it to be stormy in which case a plane cannot land. Airport will also check if it contains the plane that wants to take off in case of taking off and if it's not full in case of taking off.

New plane is created with a status :new and can be added to an available airport and become :landed. Plane will also have a
randomly generated id that will be used in messages displayed after successful landing/taking off. (I have though also of
using those to identify planes in airport, that would also let me store them in a hash).
Airport has a default capability of 30, that can be changed. Airport cannot have a capacity set to a number that is smaller
than the number of planes currently there.

Weather module contains a stormy? method that generates a random number in range (0...10); if the number is 1 it
returns true, else false.

![Alt text](airport_challenge/images/airport.png)
