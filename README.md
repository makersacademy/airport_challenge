[![Build Status](https://travis-ci.org/MaryDomashneva/airport_challenge.svg?branch=master)](https://travis-ci.org/MaryDomashneva/airport_challenge)

The program allowed to manage Airport operations.

Program has an class Airport.
  Airport has:
    1. default plane capacity = 30,
    2. initial number of planes in garage equal the default capacity,
    3. weather condition which is mostly sunny, but occasionally stormy.
  Airport can take-off and land planes. It has two methods called 'take_off_plane' and 'land_plane'.
    Plane can be landed if there is flying plane, airport is not full (number of planes in garage is less than default number) and the weather is sunny.
    Plane can be taken-off if there is a plane in garage and weather is sunny.
    When weather is stormy neither landing of taken-off can be proceed.
  Airport also has two private methods: 'full?' and 'empty?' which are checking the if garage full or empty.


Wether conditions are defined by another class Weather.
  Class Weather has method 'stormy?' which returns weather condition.
  Wether condition is set randomly from 100% where 90% the weather is sunny and only 10% stormy.

Planes defined as a class Plane.
  Class plane has method 'flying?' which define whether the plane is flying or inside the garage.
    -If plane is flying it can be only landed, but can not be taken-off until landed.
    -If plane is landed it can be only taken-off, but can not be landed again until taken-off.
  Class Plane also has methods that marked plane as landed 'mark_as_landed' or flying 'mark_as_flying'
