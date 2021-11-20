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

# Task
------

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

1
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
|    #Object    |   #Message    |
|:-------------:|:-------------:|
|    Airport    |  land(plane)  |
|     Plane     |               |

2
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
|    #Object    |      #Message     |
|:-------------:|:-----------------:|
|    Airport    | take_off(plane)   |
|     Plane     |   has_taken_off   |
|               |   has_landed      |
|               |   in_airport?     |

3
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
|    #Object    |             #Message             |
|:-------------:|:--------------------------------:|
|    Airport    |    initialize(default_capacity)  |
|               |                full?             |
|     Plane     |               raise_error        |

4
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
|   #Object    |               #Message                 |
|-------------:|:--------------------------------------:|
|    Airport   |      initialize(custom_capacity)       |
|    Plane     |               raise_error              |


5
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
|    #Object    |   #Message    |
|:-------------:|:-------------:|
|               |               |
|               |               |

6
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
|    #Object    |   #Message    |
|:-------------:|:-------------:|
|               |               |
|               |               |


# Goals
-------
1) Test Drive the creation of a set of classes/modules to satisfy all the users stories
2) Code shoe defend against Edge Cases: planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.
3)

# BONUS
-------
Write an RSpec **feature** test that lands and takes off a number of planes

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

# Notes and Thoughts
--------------------
I was really unsure on how to approach the user stories: does the plane have a method to land(airport) (like land at the airport) or is it the airport has a method to land planes...
In Doubt,  I decided to test and implement each story in similar way to the user's stories on the week's challenge (Boris_Bikes) and use method to update the plane status by creating several methods.

USER STORY ONE
we have an Airport class.
we have a Plane class.
Airport can instruct planes to land and take_off
- land(plane)

USER STORY TWO
Airport can instruct planes to take_off
- take_off(plane) -> update plane's status : plane.has_taken_off
Airport can instruct planes to land and take_off
- land(plane) -> update plane's status : plane.has_taken_off

Plane can give updates about its status
- in_airport?
Plane can update about its status:
- has_landed
- has_taken_off

** COVERAGE:  93.75% -- 30/32 lines in 4 files **
what is missing ?
- maybe edge cases:
there is no plane to take_off ? -> raise_error
there are too many plane in the airport ? user story 3
- maybe the airport received not explicit confirmation when a plane takes off or lands:
adding an explicit message : plane has takeoff / plane has landed
