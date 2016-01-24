Airport - Controlling the flow of planes: V1.0.1

Author: Mat Drake

Created: 23/01/2016

Requirements: This program was designed to run with Ruby 2.2.1

--------------------------------

Using this program, you will be able to track and control the flow of planes to and from their destinations from an airport; as well as assessing whether the conditions (weather and airport capacity) are safe for landing/take-off.

Airports can be instantiated, with the ability to (by default) store 5 planes. You can change an Airport's capacity as needed (pre and post instantiation) to store the required number of planes.

You can instantiate new instances of planes which by default will be in flight. Planes can then land/take off at/from specified Airports as long as certain conditions are met:

- To land:
  - The plane is in flight
  - The targeted airport is not at capacity
  - The weather is not stormy
- To take off
  - The plane is not in flight already
  - The plane is taking off from the airport it landed at
  - The weather is not stormy

A Weather class must be instantiated before planes can land or take off, as this is a required argument for the methods. The Weather is determined by a random number feature. Whenever a plane lands or takes off, the specified weather class will select a value between 1 and 10. If a 10 in called, the weather will be stormy; any other value and the weather is safe for landing/take off.
