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

About the program
---------

This program controls the flow of planes at an airport. The planes can land and take off provided that the weather conditions are clear. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories on which the program was based on:

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

How to Run the Program
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Approach
-------

This program was built using a test-driven approach. For each user story, unit tests were written based on
feature tests which were run in IRB. Code was then built to match each of the unit tests until all requirements have been met to form a fully-functioning program.

These classes are the building blocks of the program:

1. Plane - each plane has the ability to land or take off and shows whether it is flying or docked in an airport.
2. Airport - each airport can instruct a plane to land or take off. It was built to have a default capacity which can be modified by the user. It also checks for weather conditions to determine whether a plane is allowed to land or take off.
3. Weather - this returns a random weather condition which is taken into account by the Airport class to determine whether a plane may land or take off.


Testing Method
-----
Rspec
