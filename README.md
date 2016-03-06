Airport Challenge
=================

Requested by a client to write code to control the flow of an airport.

**This included:**
* Planes taking off from an airport;
* Planes landing at an airport;
* Confirmation that the plane has taken off/landed;
* Prevent take off and landing when the weather is stormy;
* Prevent landing when the airport is full;
* Airports have a default capacity, but this can be overridden.

**It also included defending against edge cases such as:**
* Planes can only take off from the specific airport that they are in;
* Planes that have already taken off cannot take off again;
* Planes that have already landed cannot land again.

How I went about this challenge:
--------------------------------

I first started by reading each user story and breaking down what each one was asking. I used TDD and the BDD cycle to work through each user story.

After feature and unit tests I started off with two classes, Airport and Airplane which the relevant spec files, airport_spec.rb and airplane_spec.rb and worked through all user stories and edge cases apart from the weather. Once I had completed those I went through my spec tests refactoring to use doubles and make it more DRY and concise, however I feel that this could be further improved.

Once I had completed that, I moved on to the user stories regarding the weather. I carried out feature tests, followed unit tests and then implemented code to pass those tests. The weather class generates a random number between 0 and 2 on initialization and if that number is 0 or 1 the weather is sunny (```:stormy = false```) and if it is 2, the weather is stormy (```:stormy = true```). This was as stated in the instructions: ```"use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy)"```.

I also did not use modules as I felt that no methods or tests were being shared by the different classes.

**Test coverage**

My RSpec tests currently have a 98.23% test coverage. [![BuildStatus](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)


Other notes and thoughts regarding this challenge:
--------------------------------------------------

I found it a quite hard to get going without a pair partner to talk things through with. I also struggled with encapsulation of where to put each method. I settled with ```plane.land_plane(airport)``` as opposed to ```airport.land_plane(plane)``` because it is the plane that is doing the landing and not the airport. However, the user story says:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```

This causes me to question the way I have gone about the placement of each method because it can be interpreted as: **the plane cannot land or take off without permission from the air traffic controller**, and in this case the air traffic controller is the airport class.

I also still have a bit of confusion between the use of mocks and stubs. What I have in my tests, especially the tests to override the random weather seems to work but my knowledge of these need to improve as I feel I have not used the correct one.

I had help from a couple of people to get started in terms of interpreting the user stories and also regarding error messages I could not fix myself.
