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

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

Approach
---------

* I have tried not to overcomplicate the early user stories, leaving the edge cases until the program is more fleshed out;
* For checking weather conditions, I created a new instance of Weather as a default argument. I initially tried to generate a new instance of Weather inside the take_off method, however this became impossible to test for;
* Tests have been refactored to use doubles and method stubs
* User stories implemented, then edge cases added
* Arbitrarily decided on a default capacity of 10
* The weather has a 1 in 20 chance of being stormy (also arbitrary)
