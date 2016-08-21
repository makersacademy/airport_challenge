### Airport Challenge

## Description

This aim of this project is to design a program which can control the landing and take off of planes at any airport, given airport capacity and weather requirements. Planes are unable to land or take off from an airport under stormy weather conditions and a plane cannot land at an airport which has reached full capacity. Airports are given a default capacity of 20 unless specified.

## Classes

There are three classes used in this program.

1. Airport
2. Plane
3. Weather

# 1. Airport

* Properties

  * `capacity` defines maximum number of planes that an Airport object can store. The default is set to 20, but can be overridden upon initialization of the Airport object.
  * `planes` array which stores any planes which land at the airport.
  * `weather` associates Weather object with the airport.

* Methods

  * `land(plane)` when a Plane object lands at the airport it is stored at the Airport. This may fail if capacity or weather requirements for landing are breached or if the plane is already grounded.
  * `take_off(plane)` this removes a Plane object that is stored at the airport. This may fail if the weather requirements for take off are breached or if the plane is not grounded at the airport.
  * `full?` determines whether the airport has reached maximum capacity.

# 2. Plane

* Properties

  * `grounded` provided status of plane, i.e. whether it is in flight or is based at an airport. All Plane objects will initialize with a `false` state to indicate they are in the air.

* Methods

  * `landed` changes the `grounded` status of the plane to `true`.
  * `taken_off` changes the `grounded` status of the plane to `false`.

# 3. Weather

* Methods

  * `stormy?` returns `true` or `false` depending on the result of a random number generator.
