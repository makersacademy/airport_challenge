Airport Challenge
=================

Aim
-----

The aim of this weekend challenge was to solidify our understanding of test driven development, as well as concepts such as mock tests within RSpec. In order to complete this task, I first defined what I believed the main objects would be: Airport, Plane, Weather. I also noted down the messages from the user stories that I believed would become instance methods; for example: land, take_off etc.

I completed the majority of this task without ever creating a Plane class, so that I could practice the use of doubles within my mock tests. This allowed me to narrow my tests down to testing the outcomes of my Airport methods without relying on external input from instances of Plane.

After stumbling on how to implement a randomised weather system, I decided to research Modules to see if this would solve my problem. I created a Weather module initially, but failed to understand how an imitation could be implemented into my Airport_spec file. I decided to then change my Weather module into a Weather class, after-which I learned about contexts and setting before blocs to proceed my tests.

I then saw it fit to add a Plane class where I could add instance methods such as flying?, take_flight, and ground. I learned a valuable lesson here, that tests must be written before the implementation of code at all times, as problems can occur and spiral out of control otherwise. Due to this, I had to checkout an earlier git commit to begin anew and properly follow the TDD approach. Lesson Learned!

Currently, running rubocop finds 0 offenses, and my test coverage is 100%.

Task
-----

I have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
