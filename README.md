Airport Challenge
=================

![image](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)

Introduction
------------

After the first week at Makers Academy, we were set a weekend challenge to create the common functionalities of an airport using OOD and TDD.

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  User stories below.

User Stories
------------
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
I want to be able to prevent airplanes landing or taking off when the weather is stormy
```

Model
-----
| *Objects*           | *Messages*           |
| :-----------------: | :------------------: |
| Pilot               |                      |
| Air Traffic Control |                      |
| Plane               | status(flying/landed)|
| Airport             | capacity(full?)      |
| Airport             | take_off             |
| Airport             | land                 |
| Airport             | weather(stormy/sunny)|

Airport <-- take_off        --> Plane.taking_off --> Plane(status: flying)


Airport <-- land            --> Plane.landing --> Plane(status: landed)


Airport <-- capacity.full?  --> true/false


Airport <-- weather         --> stormy/sunny

Development/Feedback
------------


Instructions
------------
First run IRB or PRY in terminal(or equivalent).
```
$ irb
$ require './lib/airport.rb'
```

Author
------
Daniel St Paul
