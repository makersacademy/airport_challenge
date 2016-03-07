Airport Challenge
(I deleted your beautiful ASCII plane, apologies)

#This is a implementation of https://github.com/makersacademy/airport_challenge, made with sweat, tea, a warm blanket and (some) swearing.

[![Build Status](https://travis-ci.org/lorenzoturrino/airport_challenge.svg?branch=master)](https://travis-ci.org/lorenzoturrino/airport_challenge)
[![Coverage Status](https://coveralls.io/repos/github/lorenzoturrino/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/lorenzoturrino/airport_challenge?branch=master)


##General idea:
- **Plane** has land and takeoff methods, knows which airport is landed at if any, and can be polled for his current status. It will raise an exception if told to land while on the ground or take off while flying.
- **Airport** has a storage with a capacity and a local weather, which gets consulted when a plane needs to land/depart and updated accordingly. He's the controller, barring planes from departing or landing in case of bad weather or full capacity (in the case of landing only), but he needs to be told which plane wants to depart/land.
- **Weather** has a current weather and the capacity to switch to a new weather, either random or on command (chemtrails are real, wake up sheeple!)

---------------------------


##Rough chronology of implementation:
#it's like I'blogging!
- Implemented a Plane class, representing..planes.
- Added an internal state and accessors method to be able to tell if airborne or not
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
- Added checks to make sure only planes in the right state can takeoff/land
- Spend a minute prentending I'm done
- Start to go through the code review file to see what I need to tweak to get to a decent codebase (hint: probably everything)
- Added stronger consistency tests. Fixed a bug in the airplane class thanks to ~~rspec~~ being awesome.
- Cleared up extra rspec, make style consistent across classes (spaces, parenthesys...)
- Found a cheasheet for markdown and formatted this txt
- Made the decision to go and try to implement a feature test in ruby instead of refactoring all the rspec test to conform to betterspec.org
