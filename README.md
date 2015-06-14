Airport Challenge
=================

Approach:

* Broke down the user stories into smaller components/problems to be solved.
* Started by writing very basic tests to cover the simplest parts - for example; a plane object can be created, it has a status of either flying or landed, it responds to the methods take_off and land.
* Once I had successfully written code to pass these tests, I followed the TDD workflow we've been learning this week - for each problem I created a manual feature test for how I would like my code to function, translated that into an rspec unit test and then worked on my code until the test was passed.

Issues:

* I feel there's a lot of refactoring still to be done in my code, but I wasn't able to implement the changes I wanted successfully. In particular, I would have liked to make the 'requesting_take_off' and 'landing' methods in my airport class to be much shorter and cleaner - I was hoping to find a way to take the 'traffic control' elements out of those methods.
* I looked at doubles but wasn't able to get my tests to work properly with them in place - this is definitely something that needs to be adjusted in my airport_spec file (and a topic that I need to go over again!)