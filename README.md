Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```
[![Coverage Status](https://coveralls.io/repos/github/makersacademy/airport_challenge/badge.svg)](https://coveralls.io/github/makersacademy/airport_challenge)
[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)

Description
---------

The Airport program controls the flow of planes at an airport. As at a regular airport, the planes can land and take off in sunny weather. Occasionally weather may be stormy, in that case the planes are not allowed to land or take off. Of course, a plane cannot land if it's already grounded at an airport, a plane cannot take off if it's already flying, furthermore a plane can only take off at an airport where it's located.
Additionally, an airport has a maximum capacity of storing planes. This can be overridden when an airport instance is being initialised.

The program has the following three separate classes in order to fulfill the requirements:

#### Airport class
Airport class is used to create airport instances. During creation of an airport instance, the following ivars are initialized:
* `@capacity`: stores the maximum capacity value of the airport. If Airport is initialized without defining the maximum capacity, the `DEFAULT_CAPACITY` is assigned to this ivar.
* `@planes`: stores the landed planes in an Array
* `@weather`: an instance of Weather is created and the object is stored in this ivar.

Used public methods:
* `take_off(plane)`: called if plane should be taken off. It calls the following methods inside the class: `check_conditions_to_take_off(plane)` and `instruct_to_take_off(plane)`
* `check_conditions_to_take_off(plane)`: used by `take_off(plane)` method, in order to validate whether the conditions are suitable for a take off: it checks the weather condition and if the plane is located at the current airport. Relevant exceptions are raised if needed.
* `land(plane)`: called if a plane should be landed. It calls the following methods inside the class: `check_conditions_to_land(plane)` and `instruct_to_land(plane)`
* `check_conditions_to_land(plane)`: used by `land(plane)` method, in order to validate whether the conditions are suitable for a landing: it checks the weather condition and if the airport is able to store the plane. Relevant exceptions are raised if needed.

Used private methods:
* `full?`: checks if the airport if full
* `stormy?`: by calling `@weather.stormy?` checks if the weather is stormy
* `instruct_to_take_off(plane)`: calls the `take_off` method on the plane, deletes the plane in `@planes` ivar, then returns a confirmation of the successful take off.
* `instruct_to_land(plane)`: calls the `land` method on the plane, add the plane to the `@planes` ivar, then returns a confirmation of the successful landing.

#### Weather class
Weather class is responsible for providing weather information to the Airport class. During the creation of an airport instance, an instance of the Weather class is initialised.
Used public methods:
* `stormy?`: it can be asked whether the it's stormy or not. In the method a random number generator is used, and there is a 10% chance that the weather will be stormy.

#### Plane class
By initialising this class, we can create a plane instance, that can be instructed by the traffic controllers located at the airport. It has an instance var called `@flying` which tells that the plane is flying (`@flying = true`) or not (`@flying = false`). Its default value is true.
Used public methods:
* `land`: set `@flying` to false. If it's already landed, an exception is raised.
* `take_off`: set `@flying` to true. If it's already flying, an exception is raised.

Used private methods:
* `flying?`: check if plane has taken off
