Airport Challenge
=================

These programs are for simulating planes landing and taking off from an airport.

My strategy for implementing this was to first create the airport (for the most part) as it was by far the more complicated of the 2 classes to implement, if only because it had more functionality. Using the example tests supplied was a good starting point and I didn't need to add many of my own until towards the end.

The plane class was just an initialize to be flying for the most part as the rest of it's functionality didn't really matter until the end, as it was only used up until that point for testing in irb.

The almost last part of the functionality added was to cross the functionality between the two classes for landing and taking off when a plane was passed to an airport. As it required only small changes to the previous tests it was fairly easy to implement after figuring out the rspec test.

The more complicated and time consuming parts were trying to figure out the use of method stubs and spies in testing. Mostly because it was the first time using them and due to small (hard to find syntax errors). 
