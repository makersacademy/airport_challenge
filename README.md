[![Build Status](https://travis-ci.org/andygout/airport_challenge.png)](https://travis-ci.org/andygout/airport_challenge)

Airport Challenge
=================

Notes:-
-----------------

* In 'plane_spec.rb' file, I felt the plane status (flying/landed) should have been tested through an airport double, but I had problems setting the stubs given a particular airport method called a plane method (to set plane's new status) from within those, so could not figure out the automatic response it should have given.

* In 'airport.rb' I have included a weather_update method as I did not want to use a traditional setter method given the value needs to be set to one of two specified values, which this method does.

* In 'traffic_control_incoming_spec.rb' and 'traffic_control_outgoing_spec.rb' for the final test for each (land/launch six planes), I was not sure if the handling required the weather fixed to 'sunny' so as to allow the process to proceed unimpeded, or if the idea was (i.e. for incoming) to leave the weather set to random and create a stack of planes that circle and then re-attempt to land following a weather update which reports a change in the weather (hence why I created this method).  However, in trying to do this I encountered problems with an instance of stormy weather creating a fail error before the process could proceed to a stack and re-attempt at landing.

* I felt with the handling of the weather I could have created a 'stormy?' attribute with a boolean value rather than, as I have done, a 'weather' attribute with the description as a string value ('sunny'/'stormy'). I felt this improved the readability slightly and also future proofs the programme so as to allow the possibility of other relevant weather conditions being included later on (i.e. hurricane, fog, etc.).  I also originally used the sample method to randomly call one of two entries in an array, i.e. ['sunny', 'stormy'].sample, but realised the brief called for the occurence of a storm to be much less likely, and so I've implemented handling that gives it a 1/10 likelihood (using rand(1..10) as a basis).

Original brief
--------------
[https://github.com/makersacademy/airport_challenge/blob/master/README.md](https://github.com/makersacademy/airport_challenge/blob/master/README.md)

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing when the weather is stormy
```

airport.spec.rb
---------------
[https://github.com/makersacademy/airport_challenge/blob/master/spec/plane_spec.rb](https://github.com/makersacademy/airport_challenge/blob/master/spec/plane_spec.rb)
```
When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.

When we land a plane at the airport, the plane in question should have its status changed to "landed".

When the plane takes of from the airport, the plane's status should become "flying".
```

plane.spec.rb
-------------
[https://github.com/makersacademy/airport_challenge/blob/master/spec/plane_spec.rb](https://github.com/makersacademy/airport_challenge/blob/master/spec/plane_spec.rb)
```
A plane currently in the airport can be requested to take off.

No more planes can be added to the airport, if it's full.
It is up to you how many planes can land in the airport and how that is implemented.

If the airport is full then no planes can land.
```

```
Include a weather condition.
The weather must be random and only have two states "sunny" or "stormy".
Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.

This will require stubbing to stop the random return of the weather.
If the airport has a weather condition of stormy, the plane can not land, and must not be in the airport.
```

grand_finale_spec.rb
--------------------
[https://github.com/makersacademy/airport_challenge/blob/master/spec/feature/grand_finale_spec.rb](https://github.com/makersacademy/airport_challenge/blob/master/spec/feature/grand_finale_spec.rb)

```
Given 6 planes, each plane must land.
Be careful of the weather, it could be stormy!
Check when all the planes have landed that they have status "landed"
Once all planes are in the air again, check that they have status "flying!"
```