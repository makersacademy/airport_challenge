Airport Challenge
=================

About
---------

* A one weekend challenge to model a simple airport using TDD, OOP, and Emergent Design

How to Contribute
-------

Since this is a challenge intended to help assess my abilities and development so far, I'm not accepting pull requests at this time.

However with that goal in mind if you'd like to offer 'thought pieces' or 'suggestions' as to areas i could look into in order to improve - please leave a comment on the repo. :)

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client.

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

The task is to test drive the creation a set of classes/modules to satisfy all the above user stories. I will need to use random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In  tests, I'll need to use a stub to override random weather to ensure consistent test behaviour. Finally, every plane must have a status indicating whether it's flying or landed.

Criteria
-----

The submission will be judged on the following criteria:

* Tests pass
* Tests coverage is good
* The code is elegant: every class has a clear responsibility, methods are short etc.

Thanks for reading,

Dan