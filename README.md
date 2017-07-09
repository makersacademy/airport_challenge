## Introduction

The Airport Challenge is a self-completed Ruby project, which concludes week
1 of Maker's Academy.

This program controls the flow of planes at an airport, the primary users being air traffic control staff.
As in real life, the program is able to check the status of a plane, authorises
takeoff and landing, including the ability to prevent either from happening in the
event of a storm.

## How I tackled this challenge

After setting up the [Feature Tests](https://github.com/annalaise/airport_challenge/tree/master/feature_tests) for each user story, I created [unit tests](https://github.com/annalaise/airport_challenge/tree/master/spec) for each of the classes.

The Airport has the most responsibility in directing air traffic in and out of the airport. It interacts with the Weather to determine flight conditions, and authorises planes to land and take off.

The Plane class allows instances of planes to be created. Each plane has attributes that return boolean values depending on whether the plane is landed or departed.

The Weather class determines, at random, whether it is be stormy or not.

## What I achieved in this challenge

All user stories have been accounted for unit or feature tests, and in the subsequent script of the program itself. Test coverage is 97.03%.

Edge cases have been defended against, and end users of this program are able to define the airport capacity themselves (see _capacity_tests_ file in [Feature Tests](https://github.com/annalaise/airport_challenge/tree/master/feature_tests)  for more details)


## Authors

This was forked from the Airport Challenge, so the task and its supporting files were authored by @makersacademy.
This solution, including feature tests, spec and library files were written by me, Annalaise Gibbons, on 8th - 9th July 2017.
