Make sure you have written your own README that briefly explains your approach to solving the challenge.
If your code isn't finished it's not ideal but acceptable as long as you explain in your README where you got to and how you would plan to finish the challenge.

## Approach / Lessons learned
- read through all user stories (rather than one at a time)
- diagram and draw out all objects
- map messages (functions) to objects
- map the information/data each object would need to hold
- { Airport => Docking Station , Plane => Bike }
- Made Stormy_Weather as a new class so a random variable can be mocked more easily

## Features
  * [x] Plane status
  * [x] Plane landing
  * [x] Plane takeoff
  * [x] Storms prevent landing
  * [x] Storms prevent takeoff
  * [x] Full airport cannot land planes
  * [x] Variable and default capacity
  * [x] Errors raised for inconsistent actions

## Bonus Features
  * [ ] RSpec Feature test

## Next / Homework
- Object ID's - takeoff and land specific planes (currently last-in first-out i.e. pop and push - as seen in Feature test)
- Potential to expand Stormy_Weather class to weather system - assigning weather to numbers within the random number range based on probabilities
- Go through Sam's video for refactoring
