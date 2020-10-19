Airport Challenge
=================

This is my solution to the Airport Challenge, as part of Makers bootcamp TDD practice.

To do this I've used three classes, `Airport, Plane, and Weather`, each of which I've tried to keep to a single responsibility. 

I made the decision to have my Plane class throw errors if you attempt to give it instructions that don't make sense (ie. taking off when already flying) as it seemed likely that this was an indicator of deeper flaws in the implementation and in a safety conscious industry it shouldn't fail silently.

Instructions
---------

1. Clone to your local machine
2. Run the command gem install bundle (if you don't have bundle already)
3. When the installation completes, run bundle
4. navigate into the project folder and run `rspec` to run test suite  