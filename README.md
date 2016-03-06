Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(___PAUL___)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```
[![Build Status](https://travis-ci.org/paulalexrees/airport_challenge.svg?branch=master)](https://travis-ci.org/paulalexrees/airport_challenge)

My objectives for this challenge:
------

* To fulfil the criteria inferred by the user stories
* To successfully implement functioning, interacting classes
* To write relevant tests that ensure the quality and consistency of my code

My approach to the challenge:
-------

Having read the user stories, my interpretation was that an air traffic controller with no specified location should be able to instruct planes to take off from or land at an airport of their choice.
My implementation was therefore to give planes methods which allow them to take off and land, and to change their 'flying' status accordingly.
Planes are instantiated in the air as there is no specification for them to be at an airport initially.
To prevent takeoff and landing when the weather is stormy, I made a **Weather** class which provides a 20% chance of stormy weather, which is checked by the plane when receiving its instructions.
A similar check is done on the specified airport as to whether it is at full capacity.

Edge cases were guarded against by checking whether a plane is flying/grounded when asked to take off/land, and whether the plane is already at the airport it has been asked to take off from.

Author: Paul Rees 05/03/16
