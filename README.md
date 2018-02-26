Airport Challenge
=================
(As interpreted by Chris L)

Usage
-------
1. Fork this repo, and clone to your local machine
2. Ensure that Ruby 2.5.0 is installed.
3. In the root directory of the repo, you can run the program via terminal using `irb -r ./lib/airport` or `require './lib/airport'` if you are already in IRB.

Commands
-------
* `airport_name(custom_capacity) = Airport.new` - Creates a new airport with a default capacity of 30 planes. This can be adjusted by including an integer value as an argument.
* `plane_name = Plane.new` - Creates a new plane.

#### Airport methods
* `land(plane)` - Lands the specified plane at whichever airport this method is called upon. If bad luck with weather, the plane may not land.
* `takeoff(plane)` - Specified plane departs from whichever airport this method is called upon. If bad luck with weather, the plane might not depart.

Approach
---------
Constructed the objects and messages based on the User Stories given by the client. Built the classes and methods sequentially and made sure to have a MVP up and running before tackling edge cases.

With the order that the stories were given in, following the TDD methodology of breaking the needed components down into their simplest parts, it practically built upon itself, feature tests making it clear about how to approach. The program breaks down into three classes: Airport, Plane and Weather. Code was refactored and certain methods might have been adjusted (whether it was to take an argument where they might not have before or vice versa) to suit the overall direction.

Outcome
-----
All user stories that were given were built to specification (at least if I interpreted them correctly!) and tests that were built around ensuring that those stories were satisfied passed - 12 tests, all green with 96.7% coverage. In that sense, I feel that I managed to deliver a MVP. However, I couldn't get the edge cases working to pass spec, so there is definitely still work to be done.

Reflections
-----
Roughly ~8-9 hours was spent on this (the majority of which was unfortunately spent using the wrong syntax and despairing on how to get my error message tests to work...) including the pen + paperwork plotting out how to construct the program. Aside from that blunder, I'm *reasonably* happy with the progress I made to construct this turned out, though there's always room for improvement.

The only external 'aid' was the code rubric which didn't necessarily give direct answers but certainly eluded in the right direction towards a workable approach for the challenge. No coach/student code was referred to for this specific solution. My own Santander Bikes solution, Google and Stack Overflow were the heavy lifters for help.

Stuff to keep a note for future progression:
* Take breaks *much* more frequently
* No, seriously, *actually* take breaks and stop trying to melt mistakes through staring at the monitor
* Practice more with RSpec tests and making sure that I'm testing the right things
* Keep on the elegant code hype train - think I managed *fairly* okay with that here, though still work to do
