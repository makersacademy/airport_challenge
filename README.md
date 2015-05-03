Airport Challenge
=================

Andy Gout notes:-
-----------------

* In 'plane_spec.rb' file, I felt the plane status (flying/landed) should have been tested through an airport double, but I had problems setting the stubs given a particular airport method called a plane method (to set plane's new status) from within those, so could not figure out the automatic response it should have given.
* In 'airport.rb' I have included a weather_update method as I did not want to use a traditional setter method given the value needs to be set to one of two specified values, which this method does.
* In 'traffic_control_incoming_spec.rb' and 'traffic_control_outgoing_spec.rb' for the final test for each (land/launch six planes), I was not sure if the handling required the weather fixed to 'sunny' so as to allow the process to proceed unimpeded, or if the idea was (i.e. for incoming) to leave the weather set to random and create a stack of planes that circle and then re-attempt to land following a weather update which reports a change in the weather (hence why I created this method).  However, in trying to do this I encountered problems with an instance of stormy weather creating a fail error before the process could proceed to a stack and re-attempt at landing.

[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master.png)](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)