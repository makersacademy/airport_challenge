# Airport Challenge

Airport Challenge is a programme to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

## My approach to solving this challenge

*Update here*
*If unfinished outline how you'd plan to finish it*

**My checklist for TDD process:**

For each user story:
- [] Discuss user stories
- [] Extract verbs and nouns into functional representation
- [] discuss and make domain model 
- [] discuss to imagine feature test

- [] for each feature:
- [] write and run a failing feature test

- [] x.times do 
- [] write failing unit test - red
- [] simplest code to pass unit test - green
- [] refactor code - (iterative cycle itself - retest each time)

- [] run a passing feature test

**Reflection on my process**

*Self reflection here*

**Code review feedback**

*Add code review feedback here*

## Test Coverage

*Update here*

## User Stories 
Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

Nouns: plane, airport
Verbs: instruct, land

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

Nouns: plane, airport 
Verbs: instruct, take-off, confirm

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

Nouns: 
Verbs: prevent, is_full?

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

Nouns: default_capacity
Verbs: overridden,

As an air traffic controller 
To ensure safety 
I want to prevent take off when weather is stormy 

Nouns: weather
Verbs: prevent, take off, is_stormy

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

Nouns: weather
Verbs: prevent, landing, is_stormy 

```

## Functional representation

| Objects | Messages |
|--- |--- |
| Plane | land, take_off, in_airport? |
| Airport | full? override(capacity) |
| Weather| stormy? |

## Domain model

<div style="width: 640px; height: 480px; margin: 10px; position: relative;"><iframe allowfullscreen frameborder="0" style="width:640px; height:480px" src="https://lucid.app/documents/embeddedchart/2b20faeb-dc8b-45e1-8200-193a02c8037b" id="mCdl_GxJ78UP"></iframe></div>

## File structure

airport-challenge
  lib
    plane.rb
    airport.rb
    weather.rb 
  spec
    plane_spec.rb
    airport_spec.rb
    weather_spec.rb
    feature_spec.rb
    
Update this:
```sh
$ tree
.
├── README.md
└── spec
    ├── docking_station_spec.rb
    └── spec_helper.rb
```


## Reflections 

* After passing the first unit test, I'm not sure which unit test to write next. respond to with(1).argument or Airplane undefined constant. 


## Process reflections

* Realise I am not taking breaks. Can use pomodoro timer when working on weekend challenges like I do in afternoon pair programming.