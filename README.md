Airport Challenge
=================

This project allows an air traffic controller control the flow of aircraft to and from their airport.

The approach I took had the plane as the focal point.  Requests were triggered by planes and authorised by an airport.  There was a lot of re-writing while I struggled with the boundaries of responsibilities.

I did accidentally glimpse the approach with the weather array and went on to employ the sample method on the array.

Unfortunately, although I strictly speaking I answered the stories, I didn't get to the stage of properly mocking the objects for testing purposes.

I occasionally struggled to overcome bad habits (code first, test later), but did manage most of the time to adhere to TDD.: I wouldn't have got as far without TDD.

The next steps in completing this?
 - revise the domain model to better flesh out the objects up front
 - re-write the tests to properly employ mocking & doubles
 
