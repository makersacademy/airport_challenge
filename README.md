# Airport Challenge ![Travis build status](https://travis-ci.org/sliute/airport_challenge.svg?branch=master) [![Coverage Status](https://coveralls.io/repos/github/sliute/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/sliute/airport_challenge?branch=master)

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

## How to Use
```
$ git clone https://github.com/sliute/airport_challenge.git
$ cd airport_challenge
$ rspec
$ irb
```

Progress
----

1. Completed steps 1-3.
2. Created a domain model with 6 + 3 (edge) user stories in docs/UserStories.md.
3. Set up Travis CI.
4. Created `Airport` and `Plane` classes for Stories 01 and 02, with corresponding Rspec files. Both have land and takeoff methods. Plane instances have a status variable. Airport instances can land one plane and have it take off.
5. Feature tested in IRB then unit-tested with Rspec for Story 01. Updated the domain model. Committed and pushed.
6. Wrote unit tests for both the airport and the plane in Story 01. airport_spec.rb needed a plane double from the very beginning, while plane_spec.rb didn't.
7. Repeated the process for Story 02.
8. Created a `Weather` class for Story 03, with corresponding Rspec file. Weather instances have random weather state. Airport instances can check for stormy weather and decline takeoffs in that case.
9. Featured-tested manually and unit-tested for Stories 03 and 04.
10. Featured-tested manually and unit-tested for Story 05. Changed airport objects to initialise with a capacity (that defaults to a constant) and a plane-holding array. Modified two other tests (in Stories 01 and 02) to accommodate the change from plane-holding generic variable to plane-holding array.
11. Tested for Story 06.

Problems
----

1. At this point, I don't know my test coverage. Tests pass in Travis (with SimpleCov), but Coveralls with config doesn't work there. The error message is: "Coveralls encountered an exception: RestClient::UnprocessableEntity. 422 Unprocessable Entity.
The bundle... command exited with 0."
2. There might be a problem with Airport and Plane objects sharing similarly-named methods (takeoff and land). Maybe I should have renamed them 'send' and 'receive' for Airport objects.
3. I realised I had done the codebase for Story 06 while working on the previous story. So I unintentionally wrote the code before the tests for Story 06 (because something similar was part of the Week 1 assignment).
4. I haven't done the edge cases.
5. I am not 100% sure that all my tests really test for what I want them to.
6. I am not convinced that my code is as simple as it could be.
