# **Airport challenge** #

[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)
[![Coverage Status](https://coveralls.io/repos/github/makersacademy/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/makersacademy/airport_challenge?branch=master)

This is a small Ruby program that simulates the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.


```
          _____
         _\____\___
 =  = ==(____MA____)
           \_____\___________________,-~~~~~~~`-.._
           /     o o o o o o o o o o o o o o o o  |\_
           `~-.__       __..----..__                  )
                 `---~~\___________/------------``

```

## User Stories ##

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

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
## Domain model ##

| Objects   |  Messages |
|    ---    |    ---    |
|   Plane   |  landed?  |
|           |  flying?  |
| Airport   | land      |
|           | take_off  |
| Weather   | stormy? |

---
###### Plane ← landed/flying → true || false

###### Airport ← land/take_off → Plane

---


## Learning objectives ##

* Object-Orientated-Design (OOD)
* Test-Driven-Development (TDD)
* RSpec workflow
* Single-Responsibility-Principle (SRP)
* Getters & setters
* Instance variables
* Doubles and mock behaviours
* Method stubs

## Demonstration in IRB ##

```
2.2.3 :004 > gatwick = Airport.new
 => #<Airport:0x00000000fcf440 @planes=[], @capacity=30, @forecast=#<Weather:0x00000000fcf350>>

2.2.3 :005 > boeing = Plane.new
 => #<Plane:0x00000000fc7e20 @flying=true>

2.2.3 :006 > gatwick.land(boeing)
RuntimeError: Weather conditions are unsuitable to land in!

2.2.3 :007 > ryanair = Plane.new
 => #<Plane:0x00000000fbb008 @flying=true>

2.2.3 :008 > gatwick.land(ryanair)
 => [#<Plane:0x00000000fbb008 @flying=false>]

2.2.3 :009 > gatwick.take_off
RuntimeError: Weather conditions are unsuitable to take off in!

2.2.3 :010 > gatwick.take_off
 => #<Plane:0x00000000fbb008 @flying=true>

2.2.3 :011 > gatwick.take_off
RuntimeError: There are no planes at the airport!

2.2.3 :012 > stansted = Airport.new(6)
 => #<Airport:0x00000001380eb8 @planes=[], @capacity=6, @forecast=#<Weather:0x00000001380e40>>

2.2.3 :013 >
```
## What I learned ##

* Main thing was the TDD process. I think I've finally grasped the workflow order:
  * Feature test using IRB
  * Failing unit test
  * Write simplest code to pass it
  * Refactor to fully implement the feature
  * Test it out with IRB again
* Getters and setters
* Take small steps.

## What I struggled with: ##

* It was confusing initially whether to have a flying? method that can be called on a plane or to have a @flying attribute with an attr_accessor. I decided to go with the attribute as it was simple to initialise a plane with a true value (start planes out flying).
* Public and private methods still confuse me slightly and the overall scope within a class. This is definitely something I need to study and add to this program to avoid for example the @planes array from being edited outside of the class.
* Figuring out how to stub the behaviour of methods to override random weather behaviour.

## Outlook ##

* Add a (plane) parameter to the take_off method so that specific planes can be released.
* Return errors if those specific planes have already taken off.
* Return error if the user tries to land a plane that is already grounded.
* Perhaps give extra information such as an ID or no.passengers to the plane objects?
* Bonus Rspec feature test
