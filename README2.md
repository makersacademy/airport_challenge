Airport Challenge
==================

````
## Approach to solving the challenge

This README is to briefly explain my approach to solving the Airport Challenge.

After reviewing the challenge I made a note of the tasks I'd need to complete.

1. Create a set of classes/modules to satisfy user stories.

2.Use a random generator with a 'stub' to set the weather.

3. Check code produced defended against edge cases.

I also noted it would be necessary to create separate files for every class, module and test suite.

I drew a diagram identifying what classes I thought would work well with the user stories presented.

I then clarified what the purpose of each Class was in my diagram.

I then identified how each class would need to interact witch each other keeping in mind there should only ever be a single purpose.

The classes I had where

Plane
Airport
Weather
Capacity
System Designer

They would interact as follows:

Plane <--------> Airport
Is it OK to land / take off?

Airport <--------> Weather
Is the weather safe or not?

Capacity <--------> Airport
Is the Airport at capacity or not?

Capacity <--------> System Designer
Set the capacity

I then followed TDD principles to work through each user story in the order they where presented.

Is all code written test-first
100% test coverage?
All tests passing?
Test conforms to Rubocop style guide?
If not completed where have I got to + how I would plan to finish the challenge

The test coverage statistics SimpleCov generates after your tests will show you what your coverage is like and where it's lacking.

Advanced mode: run rubocop before every commit you make and fix mistakes before you even commit!
