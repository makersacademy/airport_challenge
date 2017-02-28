Airport Challenge
=================
[![Build Status](https://travis-ci.org/tvfb85/airport_challenge.svg?branch=master)](https://travis-ci.org/tvfb85/airport_challenge) [![Coverage Status](https://coveralls.io/repos/github/tvfb85/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/tvfb85/airport_challenge?branch=master)
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

About this project
---------
Design software to control the flow of planes at an airport. Planes must be able to land and take off, providing the weather is not stormy (which it is on rare occasions). Also when the airport is full, prevent planes from being able to land.

TDD
---------
This project has been created using test-driven development, starting with the following user stories:

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

In the first instance, the above client requirements were mapped into a domain model, before carrying out both feature and unit tests to guide the design and ensure satisfaction of the brief.

Additional notes
---------
Test coverage is > 95%  
Test doubles have been used to override inconsistent weather behaviour
