Airport Challenge
=================

Task

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

***Stories Completed(JavaScript challenge in JavaScriptAirport folder)***
User story 1 - User story 1 complete. I initially tried to create the function airport.land(plane) which seemed to be working until the point where I had to push the plane into the array, so I refactored my tests to follow the walkthrough more closely and have the land function in the Plane class.

User story 2 and 3 - User story 2 and 3 complete . I implemented the same method for takeoff as I did for landing in User story 1 but in the plane class included 'this_location' which was assigned to 'airport' I also added some more tests for an error to be raised when the airport was full and when it was empty.

User story 4 - capacity - had already begun this in user story 3  but refactored code and test to include DEFAULT_CAPACITY to get rid of the magic number.

User story 5 - User story 5 complete. To pass the test,  I created a 'isStormy' function that returned false by default and created a guard clause within the 'clearForTakeoff' function that would through the error when isStormy was true. I also refactored my capacity test to have 'capacity' = 'DEFAULT_CAPACITY'.

User story 6 - User story 6 complete. I created a test similar to that in user story 5 but landing rather than takeoff and added a guard clause to the 'clearForLanding' function to make it pass.

Final refactoring -
I refactored my code and tests with help from the walkthrough to give the weather responsibilities to a weather class .


***Part 2: Learning a New Language***
I have included notes I made (and am still in the process of updating) during the week while learning JavaScript(they are also located in the JavaScriptAirport folder). In addition to practicing with the FizzBuzz and thermostat challenges, I also completed the JavaScript exercises on the W3 Schools website which helped me understand a lot of the syntax, and I am still working my way through Code Academy exercises.




**Stories completed(Ruby)**

README - Refactoring
User story 2 - Refactored the plane.land test removing plane = airport.release_plane, after refactoring the test. Nested describe block for the "release_plane" method

User story 3 - Refactored test as methods takeoff and landing not needed in Plane class as they are in the Airport class. These methods have been been removed from Plane class and methods "release_plane" and "runway" have been renamed in the test and code to "takeoff" and "landing"

User story 4 - updated @plane attribute to @planes = []. Also updated test as code now contains an array. Also refactored code to include a private method for whether the airport is 'full?' or 'empty?'. Initially set capacity at 10 and then refactored test and code, adding 'DEFAULT_CAPACITY' to remove the magic number (in this case 10).Refactored again using attr_reader create a 'capacity' method and used 'initialize' to set initial value as "DEFAULT_CAPACITY". In the process of completing this story.
