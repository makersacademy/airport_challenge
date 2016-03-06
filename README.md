Airport Challenge
(I deleted your beautiful ASCII plane, apologies)

This is a implementation of https://github.com/makersacademy/airport_challenge, made with sweat, tea, a warm blanket and (some) swearing.

https://travis-ci.org/lorenzoturrino/airport_challenge.svg?branch=master

so far:
- Implemented a Plane class, representing..planes.
- Added an internal state and accessors method to be able to tell if airborne or not (test edge cases)
- Implemented a Airport class, to act as container and controller of planes.
- Added internal storage and methods to be able to store, land and dispatch planes.
- Added Airport methods to switch landed/airborne status of planes being launched/landed
- Implemented a Weather class, to dispatch weather updates
- Added Weather methods to change weather randomly or to a given value, and to read it
- Made my beautiful methods ugly and went through great pains to avoid including the Weather class in the Airport one
- Scrapped everything due to too many parameters being thrown around. Airport now has a weather instance loaded.
- Added a capacity, and the ability to raise an error if a plane tries to land to a full airport.
- Added a default capacity, and the ability to init a class with a different one.
- Slept and spent the morning cleaning the bathroom because holy hell my flatmates are animals.
- Did a round of correction to get along with Hound CI
- Activate Travis CI, added that beautiful tag over there (it is working, right?)
- Added internal plane status with airport currently landed at to shield against edge cases.


TODO how i implemented stuff
