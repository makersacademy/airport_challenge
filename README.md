Airport Challenge
=================

The aim of this project was to create a program that can control the flow of planes into an airport, they should be able to land and take off weather permitting (not able to land/takeoff in stormy weather).

Here are the user stories I was provided:

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
## Approach:

I looked at the user stories individually, and decided which objects and messages I needed to take from them:

| Objects | Messages |
|:------:|:------: |
| Airport | land |
| Airport | takeoff |
| Airport | capacity |
| Plane |      |
| Weather | sunny/cloudy |

I then worked through each user story, firstly setting up a feature test in irb, then setting up RSpec tests for each object they contained and adding each object as a class. I then looked at the message and added those in as methods to interact with each class, examples of this can be found in [PLAN.md] (myLib/PLAN.md).

As you may have noticed, the further I got in the user stories, the less I recored my progress in my PLAN.md, this is a lesson learnt not to be too eager to get into writing test/production code, but to properly plan my approach, as I think it slowed down my progress somewhat.

I got blocked after trying to incorporate my weather randomiser into my airport class, I think if I were to work on this challenge again, I may try to create the randomiser in the airport class to see if it works.

I am mostly happy with the progress I made with this project, however moving forward I will try to incorporate more doubles in my tests, find more solutions for edge cases and spend more time refracting my testing and production code.  
