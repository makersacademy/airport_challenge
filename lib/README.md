# Airport Challenge, Jake's Submission #

Using this program is as follows:

The runway begins empty.

In order to land a plane, call the land method on TrafficControl with a new unique Plane class as an argument.

In order to allow a plane to take off, call the takeoff method on TrafficControl with a unique, already landed plane as an argument.

The weather state is stored in the Weather class, the state of which can be checked by calling the stormy? method on it.

### This is where I ran into issues. ###

The test for stormy weather functionality is in the spec file, and while I could get a "Stormy weather" runtime error to display on the console, I could not get RSpec to register it.

I would proceed by having a raise and guard clause that will read the Weather method (./lib/weather.rb) and evaluate the truthy or falsiness of the stormy? state.

If stormy? is true, a runtime error is thrown and planes can neither land nor take off.