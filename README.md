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

# Task Overview
This project was the first weekend challenge for Makers Academy. The task aimed to test drive a working model of an air traffic control system at an airport, built in Ruby and tested using RSpec. Planes should be allowed to land, be stored, and take off from an airport. Planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.


## Learning Objectives Covered
* TDD (Learn how to use stubs and test doubles)
* Debugging
* Principles of OOD (Class properties and inheritance)
* Writing procedural programs in Ruby


## Tools used
* Ruby
* RSpec


# Instructions
```
$ irb
2.6.5 :001 > require './lib/airport'
 => true
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007fc7aa9b44d8 @hangar=[], @capacity=20>
2.6.5 :003 > plane = Plane.new
 => #<Plane:0x00007fc7aa9c7830>
2.6.5 :004 > airport.land(plane)
 => [#<Plane:0x00007fc7aa9c7830>]
2.6.5 :005 > airport
 => #<Airport:0x00007fc7aa9b44d8 @hangar=[#<Plane:0x00007fc7aa9c7830>], @capacity=20>
2.6.5 :006 > airport.take_off(plane)
 => #<Plane:0x00007fc7aa9c7830>
2.6.5 :007 > airport
 => #<Airport:0x00007fc7aa9b44d8 @hangar=[], @capacity=20>
2.6.5 :008 >
```

# Approach

## User Stories
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy
```
----  
### User Story 1
----
Objects | Messages
------- | --------
User    | 
Plane   | "Land"
Airport | "Instruct plane - land here"
 ----  
 
### User Story 2
----
Objects | Messages
------- | --------
User    | 
Plane   | "Take off"
Airport | "Has plane left?"
 ----  
 
### User Story 3
----
Objects | Messages
------- | --------
User    | 
Airport | "Full?"
Plane   | "Can't land"
 ----  
 
### User Story 4
----
Objects  | Messages
-------- | --------
Designer | 
Airport  | "Set / change capacity"
 ----  
 
### User Stories 5/6
----
Objects | Messages
------- | --------
User    | 
Plane   | "Don't take off / land"
Weather | "Stormy?"
 ----
 
## Spec Requirements

As the user stories specified that the airport was instructing the planes to land or take off I determined the airport to be the main class object. I used the spec to isolate the two principal methods - land and take off - and opted to deal with each method one by one (land first) completely through the requirements of each user story and the varying contexts attached to each. I used the following methodology to approach this build: Planning (user story breakdowns --> domain models, pseudocode), feature testing, unit testing, Red/Green/Refactor loop.

### Tasks
- [x] Set up Airport and Plane classes
- [x] Input methods for Land and Take Off
- [x] Set ammendable default capacity for Airport instance
- [x] Store landed plane instances in 'Hangar' array as default 
- [x] Randomly generate weather conditions
- [x] Write preventative contexts and associated methods for 'Land':
    - [x] if airport hangar full
    - [x] if weather stormy
    - [ ]  if plane already landed
- [x] Write preventative contexts and associated methods for 'Take off'
    - [x] if airport hangar empty
    - [x] if weather stormy
    - [ ]  if plane already flying

# Reflection and stretch goals
-----
This challenge helped me consolidate the week's work and improve my understanding of TDD methodology and RSpec syntax. I would like to improve on my ability to adhere more rigorously to the methodical structure of TDD to help ensure simplicity and elegance in my test writing and production code. 

In the time constraints I didn't manage to include edge cases into my build. I would like to revisit and add the following contexts and features:
* Prevent a flying plane from taking off
* Prevent a landed plane from landing
* Have planes take off and land at different airports
* Ensure plane lands and takes off from the same airport
* Allow for multiple planes to land and take off from an airport
