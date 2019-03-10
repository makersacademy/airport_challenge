# Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

## Description
-----

We were asked to create a program that:
1. instructs a plane to land at an airport
2. instructs a plane to take off from an airport and confirms that it is no longer in the airport
3. prevents takeoff when weather is stormy
4. prevents landing when weather is stormy
5. prevents landing when the airport is full
6. has a default airport capacity that can be overridden as needed

While ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

## Instructions
clone this repo
cd airport_challenge
irb
require '../lib/airport.rb'
airport = Airport.new
plane = Plane.new
airport.land(plane) # if the weather is good plane will be stored in airport
airport.takeoff(plane) # if there is a plane stored in airport plane will fly (if the weather is good)

## About
When submitted this program had:
*   11 tests, all passing
*   97.06% test coverage -- 99/102 lines in 4 files
*   0 linter warnings

## Steps taken to complete this task
1.The first thing was to break all the user stories down into objects and messages (see tab called 'User Stories')
2. Next, the stories were ranked by importance. It was assumed that system design was the most important, the moving of passengers second most, followed by safety (in reality this will be done in consultation with a client and the ranks might be very different).
3. A test was written to see whether system designers can create airport objects.
4. System Designers are now able to create instances of Airports. The next step is to ensure that aiports have a capacity. That means checking that the new airports have an attribute called capacity and that it is set to something, say 20.
5. Currently all airports created will have the same capacity, SDs should be able to set a value of their own. Next test need to check if when the SD initiates with an argument capacity is set to that argument.
6. Time for a commit: "First Commit: A simple program that allows a user to create an airport and set the capacity of the airport."
7. The first user story is satisfied and there is no refactoring to be done.
8. Air Traffic Controllers should be able to instruct planes to land. The next test checks if a plane class exists.
9. Planes must respond when told to land. This test checks whether planes respond to a method called land.
10. This test checks if a planes status changes from flying to landed it is told to.
11. Airports need to store the plane (this was never explicity mentioned but is key to the rest of our program). This test checks if an airport can store a plane.
12. A plane needs to land at an airport. The test should check if the method receives arguments.
13. Landing the plane at an airport needs to store it there. Rewritten test for land now uses a double for an airport with a method stub for store.
14. Time for a commit: "Program now includes planes which can land and be stored at airports."
15. Refactoring: removed redundant test in for plane class.
16. Repeat steps 8 to 13 for takeoff.
17. A plane needs to confirm that it is no longer in the airport (and to confirm when it does not leave the airport). Two tests using doubles and method subs to show that this is being done.
18. Time for a commit: "Planes can now take-off, reporting back whether take-off was successful or not."
19. Refactoring: created private methods in plane class for better readability and to reduce repitition.
20. ATCs need to prevent take-off if the weather is stormy (created a private method in airport to determine weather conditions). Test a check_weather method that tells us what it's like at an airport.
21. Update our old plane tests to work in good weather.
22. Planes should not take off in stormy weather so the test should show that a plane is grounded after it tries to take off in stormy weather.
23. Time for a commit: "Planes can now only take-off in good weather."
24. Refactoring: removed redundant test in for airport class, rewrote tests for weather, used private method to check if plane is able to proceed.
25. Planes should not land in stormy weather so the test should show that a plane is flying after it tries to land in stormy weather.
26. Time for a commit: "Planes can now only land in good weather."
27. Refactoring: none required.
28. All user stories have been satisfied. The next step is to solve edge cases, currently planes can take-off while flying and land while grounded.

**BONUS**

*   Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)
