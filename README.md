Makers Academy 1st Weekend Challenge - Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------'''''
                =  ===(_________)

```
Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

User stories
------------

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

Solution
--------

My solution is made up of 4 classes:


* Controller - Understands how to control two arrays: one each for inbound planes and outbound planes. It is able to instruct planes to take off or land and takes into account the weather and the airport capacity
* Airport - Understands how to control planes in the airport if issued an instruction by controller
* Plane - Understands if a plane is airborne
* Weather - can be instantiated with an array of weather updates (only fine or stormy) which are provided randomly to Controller

How to Set Up
-------------
```
git clone https://github.com/philb56/airport_challenge
```
if not installed already
```
gem install bundler
```
then
```
bundle install
```

How to run tests
----------------
Note: Coverage stats provided by Simplecov
```
rspec
```
should give:
```
Airport
  Check airport capacity
    sets capacity to default capacity
  Check airport capacity
    responds to full?
    should be not full by default
    should be empty by default
  Landing
    should be able to land a plane
  takeoff
    should be able to make a plane to takeoff
    should be able to make a plane to takeoff2

Controller
  tests around landing permission
    can determine that landing is permissible if weather ok and airport has capa
city
    can determine if landing is not permissible if its stormy
    can determine if landing is not permissible if airport is full
  tests around takeoff permission
    can determine that takeoff is permissible if weather ok and there are planes
 on the ground
    can determine that takeoff is not permissible if weather bad
  tests around inbound planes,
    should make landing instruction should fail if no inbound planes
    should make landing instruction should fail if airport closed
    should make landing instruction if all ok
  tests around outbound planes,
    should not make take_off instruction if airport empty
    should not make take_off instruction if stormy
    should make takeoff instruction if all ok

Controller
  should be able to manage landing three planes

Plane
  Check airborne
    plane should be airborne
    plane should not be airborne
    can set plane to be airborne

Weather
  Check stormy?
    should be fine
    should be stormy

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.04688 seconds (files took 0.74096 seconds to load)
24 examples, 0 failures


COVERAGE: 100.00% -- 209/209 lines in 9 files
```
Linting
-------
Used Rubocop - no offenses

How to Run
----------

# instantiate the 4 classes
* airport = Airport.new(3) # only 3 planes allowed in the airport this time
* weather = Weather.new([:fine, :fine, :fine, :fine, :stormy])
* planes = [Plane.new, Plane.new, Plane.new, Plane.new]
* controller = Controller.new(airport, weather, planes) # instantiate controller with 4 inbound planes

# land
controller.issue_landing_instruction

# take off
controller.issue_takeoff_instruction
...

Errors raised
-------------

* On Landing - "No inbound planes" means the array of inbound planes is empty
* On Landing - "Landing not possible at the moment" - means either that it's stormy or the airport is full
* On Take Off - "Take off not possible at the moment" - means either that it's stormy or the airport is empty

IRB Example
-----------

This script can be pasted into irb to mimic the feature test
```
require  "./lib/airport.rb"
require  "./lib/controller.rb"
require  "./lib/plane.rb"
require  "./lib/weather.rb"

# new airport with max capacity of 3 planes
airport = Airport.new(3)

# weather is fine
weather = Weather.new([:fine])

# 4 planes exists - 1 more than capacity
planes = [Plane.new, Plane.new, Plane.new, Plane.new]

# Add airport,  weather and planes to controller
controller = Controller.new(airport, weather, planes)

# Land 3 planes OK
controller.issue_landing_instruction
controller.issue_landing_instruction
controller.issue_landing_instruction

# 4th plane oversteps capacity so gets: Landing not possible at the moment
controller.issue_landing_instruction

# one plane takes off - creates capacity
controller.issue_takeoff_instruction

# 4th plane can now land
controller.issue_landing_instruction

# All 3 planes on the gound take off
controller.issue_takeoff_instruction
controller.issue_takeoff_instruction
controller.issue_takeoff_instruction

# Attempting to get another plane to take off when airport is empty gives: "Take off not possible at the moment"
controller.issue_takeoff_instruction

```

Things that need improving
--------------------------
* controller_spec.rb needs refactoring - lots of duplication particularly the doubles
* feature_test_spec.rb - just one big test - could be broken down and more tests added
