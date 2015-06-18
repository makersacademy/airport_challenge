Brief description of task:
-------------------------

We are building a system to control the flow of planes at an airport. Our system will allow planes to land and take off from the designated airport. Our system will keep track of the number of planes at each airport. Occasionally airports will be full - planes will not be permitted to land if the airport if full. Planes will only be allowed to take off if the weather is sunny; when the weather is stormy planes will be prevented from taking off.



What I did:
-----------

* First I put pen to paper to break down the problem into smaller parts to make it easier to understand - constructed basic domain model
* Class-responsibility-collaboration cards for Plane and Airport classes to help organise user stories into classes and responsibilities
* I started with the plane class as it seemed like the most straight forward, firstly I created a method for airborne, and set it's state to true in the initialize method to, so that all instances of the Plane class are airborne when created. From there I added a take off and a land method
* For the airport class I added a default capacity of 100 planes, created an error message to be run when a plane attempted to land at an airport that had reached this max capacity.
* I created en empty planes array for each instance of airport to track the number of planes and created methods for landing planes and receiving_planes to manipulate this array
* I had trouble naming methods appropriate names within the Airport class
* I also had issues with the various tests in the airport_spec - instructing plane to land, receiving a plane, instruction plane to take off, and releasing plane tests - I haven't managed to implement tests that actually test anything so far...
* Where possible I used examples and parts of the Boris Bike example and applied them to the Airport challenge - eg. for capacity and planes array to keep track of the number of grounded planes at the airport, I modelled the landing and release_plane classes on the dock and release_bike classes



Post 1:1 with Ptolemy:
----------------------

Ptolemy helped answer any outstanding questions I had and ran through some ways to improve my challenge by doing following:
* In airport_spec - I refactored group tests related to a particular method together with a context block and updated some tests to use one-liner syntax combines with context blocks instead (where appropriate)

* Double added in airport spec to remove dependency

* Implemented weather condition tests for stormy and sunny conditions - using stubs to stop randomly returned stormy weather condition - guidance provided by Ptolemy on first stage and how to use stubs here.

* Refactored to group tests related to a particular method together with a context block
