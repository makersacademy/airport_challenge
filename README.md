[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)

Airport Challenge
=================

Task
----

To create the feature tests, matching unit tests and application code to meet the brief.


Brief
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client.

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
I want to be able to prevent airplanes landing when the weather is stormy
```

How to run
----------

Type `rake` in the application's root folder.

Application Code:
-----------------

- `./lib/airport`
- `./lib/plane`

Tests
-----

Feature Tests:
`./spec/feature/grand_finale_spec`
- 6 planes can be created
- 6 planes can land at specified airport
- Plane is denied landing permission when airport is at maximum capacity
- 6 landed planes have status 'landed'
- After all 6 planes takeoff there are no more landed planes
- After all 6 planes takeoff their status is 'flying'

Unit Tests (Airport):
`./spec/airport_spec`
- Can order a plane to takeoff
- Can respond to a plane wanting to land
- A plane cannot land if the airport is full
- A plane cannot land when it is stormy
- A plane cannot takeoff when it is stormy

Unit Tests (Plane):
`./spec/plane_spec`
- Has a flying status when created
- Is located in the air when created
- Can request to land at specified airport
- Responds to land
- Has a status of landed after landing
- Does not respond to land after landing
- Responds to takeoff
- Can request to takeoff
- Changes its status to flying after takeoff
- Does not respond to takeoff after takeoff

ToDo:
----

- Apply Object-Oriented principles
- Setup a running simulation
- Restart from new and do it again!  And again!  And again!
- ~~Enable random weather conditions~~
- ~~Ensure plane does not land without permission~~
- ~~Ensure plane does not takeoff without permission~~
- ~~Unit tests for airport traffic control using doubles~~
- ~~Ensure a plane cannot land if airport is full, using double in unit test~~
- ~~Ensure planes cannot land when landed~~
- ~~Ensure planes cannot takeoff after takeoff~~
