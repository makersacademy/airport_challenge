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

Overview
---------

The project consists of an application that can be run from the command line. The application comes following a request from a client to write software to control the flow of planes at an airport. Planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

User stories
-------

These were written following discussions with the client regarding the type of functionality provided by the application:

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

Approach
---------

My approach was to follow a TDD framework by working through each user story and designing feature tests and unit tests to specify what I needed my code to achieve. User stories were pasted into one of three relevant spec files: airport_spec, plane_spec and weather_spec. If multiple unit tests were required for a user story, these were broken down into their components so that they could then be converted into unit tests.

I encountered many issues along the way, and consistently reviewed a similar project (boris_bikes) for inspiration/ideas when I was unable to see the way forward. I must also credit the github page of my Makers mentor, CodeZeus-dev, which I used on several occasions as a sense check for my unit tests.

I created 13 unit tests for the 6 user stories. There are 3 different classes: Airport, Plane and Weather. Each is contained in a separate ruby script.

I encountered the following problems:
  - Issues downloading ruby version 2.6.5. Error message: "Warning: Calling `brew list` to only list formulae is deprecated! Use `brew list --formula` instead." Issue was eventually resolved.
  - A problem with RSpec syntax that took me a lot of time to resolve, and seemed to magically resolve itself without any clear-cut iterations to the RSpec unit tests. When trying to write unit tests that expect errors, I would successfully trigger the errors but the unit tests would still fail. I cannot recall the full error message, but it would be something like: "RuntimeError #"RELEVANT ERROR MESSAGE" with backtrace".

How to run the program
-----------------------

1. Clone this repository to your local machine
2. Open irb from the command line
```$ irb```
