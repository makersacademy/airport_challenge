# Makers Week 1 - Weekend Challenge - Airport

## This project is a coding challenge in Ruby demonstrating the use of test driven development.

It should control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

This codebase will be tested using Rspec as a framework.

 ## DOMAIN MODELS FROM USER STORIES

Airport <--- takeoff ---> a Plane
Airport <--- land ---> a Plane
Airport <--- full? ---> true/false
Weather <--- ok for takeoff/landing? ---> true/false

## Notes
  - The default airport capacity is 10 planes
  - occasional stormy weather assumed to be 5% chance

  ## Status
  - random weather tests/code currently not working
  - edge cases still to be defended against