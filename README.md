######Airport Challenge

### Synopsis 

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

### Approach:

Taking a similar approach to Boris-Bikes challenge the majority of methods are nested in the Airport class. Planes land and take off from planes array. There are conditions taht prohibit planes taking of and landing in stormy weather, this weather is set by a random algorithm. Planes can't land if they are already landed, or take off if they are already in the sky.

In the spec files the plane class is substituted by a double. Ideally this would be an array of individual planes but it's beyond my grasp at the moment and I've run out of time to implement that.

### Test:

To test, run rspec from airport_challenge dir.

In IRB require './lib/airport.rb'

### Review:
* lots of 'stormy_false' in spec files - probably an easier way of doing this
* couldn't create double array to satisfy bonus feature test
* couldn't test for random value
* take_off and land methods longer than desirable
* might be better to initialize with existing planes?
* can't test using multiple new double planes in current code

### Author:
Joe Cowton
