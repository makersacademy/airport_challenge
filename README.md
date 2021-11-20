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
|    Airport    | land_plane    |
|:-------------:|:-------------:|
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
|:-------------:|:-----------------:|
|     Plane     |   in_airport?     |

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
|:-------------:|:--------------------------------:|
|      plane    |               raise_error        |

4
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
|   #Object    |               #Message                 |
|-------------:|:--------------------------------------:|
|    Airport   |      initialize(custom_capacity)       |
|-------------:|:--------------------------------------:|
|    plane     |               raise_error              |


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

# Notes
-------
I was really unsure on how to approach the user stories: does the plane instance has a method to land(airport) etc.
So I decided to test and implement each story in similar way to the user's stories on the week's challenge (Boris_Bikes)

USER STORY ONE
we have an Airport class.
we have a Plane class.
Airport's instances:
- have a method to land(plane)

USER STORY TWO
Airport's instances
- have a method to take_off(plane)
Plane's instances
- can give updates about their status : in_airport? -> true or false
