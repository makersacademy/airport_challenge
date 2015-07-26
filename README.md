Airport Challenge
=================

Makers Academy Week one
-----------------------

The Airport Challenge was set to test my capability of followning the principles of Test Driven Developlment and Object Orientated Design.

User Stories:
-------------

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing or taking off when the weather is stormy
```

The stories were worked on in an granular way. Each feature was tested in IRB. If not avaiables an Rspec test was written to duplicate the feature test. Then the required code was written to pass the test.

Domain Model:
-------------

| Class | methods |
|---|---|
| AirPort | request_landing, request_take_off, planes, capacity, weather |
| Plane | land, take_off, flying?, landed?|


This is the classes and main methods that were created with  test driven developlment from the stories.As the code was refactored more methods were added to impreove readability however they are triggered by the main methods above.

To illustrate how the methods and classes were written on the first part of the user story after testing had created the need for Airport and Plane classes, airports needed to be able to be requested to allow a plane to land. A test was created to test if an instance of the Airport class had a take off method, unit test written and code passed, a test was created to test if when the method reuquest_take_off is passed an instance of Plane it authorises it for take off. Again this test failed, a unit test was written in rspec and code was written to get the test to pass. Each part of the user story was added this way. The key is to design through the tests and write code to pass the tests.

After tests a test had passed I then went through a cycle of refactoring to tidy up the code, remove repatition and give classes and methods single resposibilties.

