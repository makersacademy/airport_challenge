Airport Challenge - James Miller
================================

[![Build Status](https://travis-ci.org/james-miller/airport_challenge.svg?branch=master)](https://travis-ci.org/james-miller/airport_challenge)

Approach taken
--------------

Interaction between planes and the airport is fairly straightforward. I have taken the approach that the airport will be responsible for giving 'land' and 'take off' orders to the planes. In essence, the idea is that an air traffic controller at the airport could use irb to direct planes to land and take off.

I have decided to implement the weather as a kind of external service that the airport makes use of. Every time a controller wishes to land or launch a plane the weather automatically gets checked using the ```stormy?``` method. This generates a new weather report from the external weather report provider, which will confirm the current conditions.

In tests I have stubbed out the randomly-generated weather by overriding the airport's own ```stormy?``` method, rather than making any kind of reference to the externally-provided weather report.

In a couple of places RuboCop has forced me to cut down line length in some of the tests which expect an error to be raised. In order to do this I have had to assign the expected error message to a variable and use that.

I have not included any modules as there was not really any common functionality that could be extracted. However you could envisage a ```Helicopter``` class that would share some behaviour with ```Plane```, or if you were implementing a nationwide air traffic control system with multiple instances of ```Airport``` there could be other classes like ```AircraftCarrier``` or ```Heliport``` that would have common functionality.
