# Airport Challenge

## What was this challenge?

The original repo can be found [here](https://github.com/makersacademy/airport_challenge)

## How did I approach solving this challenge?

I transferred my User Stories to "index cards" (Mac stickies).
![user_stories](https://github.com/sebastianchristopher/airport_challenge/tree/master/images/stickies.png)
I then translated these User Stories to a an Object-behaviour/method table (photo).
I then sketched out an interaction diagram/model (photo)
My basic feature test was:

> airport = Airport.new
> plane = Plane.new
> airport.instruct_plane_to_land(plane) # => plane lands or warning message about weather

and variations on this (instruct_plane_to_take_off).
Using my feature tests as a guide, I turned my user stories into discrete unit tests (post-its image) and TDD'd them - write test, Red, Green, Refactor. As I didn't have my other classes yet I used doubles, stubs and mocks to substitute them and imitate their behaviour - I had an idea of what this would be thanks to my diagram from before.
I repeated this for the Weather and Plane classes.
I then wrote another feature test:

> airport = Airport.new
> plane = Plane.new
> airport.instruct_plane_to_land(plane)
> airport.instruct_plane_to_land(plane) # => plane can't land twice so expect error

which allowed me to land the plane twice - so I went back to writing my unit tests, for edge cases (photo) of stickies. TDD, Red Green Refactor again.
To test my code fully, with all the classes written and passing their tests, I created a branch and swapped the doubles for the Class counterparts (due to the randomness in the Weather class that had to remain stubbed).
