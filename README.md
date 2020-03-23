Airport Challenge
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

MAKERS ACADEMY Weekend 1 Challenge - Airports.

In this weekend's challenge we are taking the following user stories and translating these stories into domain models in order to determine what objects and methods we're testing.

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

Domain model:

Objects : Airport, Plane

Methods(airport): land, launch

now from reviewing the User stories I've split them up into three sections, takeoff/landing (stories 1 and 2), capacity (stories 3 and 4) and weather (stories 5 and 6)

These are the requirements outlined in the user stories:

1. Should be able to land a plane at an airport.x
2. Should be able to launch a plane from an airport.x
3. Plane should no longer be in airport after taking off.x
4. Plane should not be able to land at full airport.x
5. Airport should have default capacity.x
6. Airport should allow default capacity to be overwritten.
7. Airport should not allow plane to launch in stormy weather.
8. Airport should not allow plane to land in stormy weather.


After writing the test and code to meet these requirements I realised I'd basically written a single class which did a bunch of things, so I started breaking down each method into individual parts and really thinking about where they should sit, in the end I decided to have the airport still performing the landing and launching of planes, the planes would track if they were in the air or not and the airport would initiate and store a new instance of a weather class, which would be sunny 2/3rds of the time unless a weather argument is passed at the point of instantiation.

After writing the above I realised that my tests had not been isolated! NIGHTARE! In refactoring the tests to work without any dependencies on other classes I ended up encountering some difficulty with how I had been storing the weather in the airport, every time I tried to separate out weather I get issues with trying to call Weather.new and Rspec was letting me know that that was an uninitialized constant. I spent a long time looking at instance_double, class double, mock_model, spies and stubs and various different possible solutions however I did not have much success in implementing them, they all failed to solve the problem that I was encountering. I'm sure that this is a failure on my part, however as time was marching on I decided to cut my losses and instead of rewriting my tests to pass my code I would come up with a way of forcing the weather behaviour in the tests and refactor my code to work with these new tests. the end result of this was a predicate method which calls a method from the Weather class - now there's no need to instantiate weather at any time - the downside to this is that I have to dictate how the weather behaves in every test, which means that it makes it almost impossible to test if this method works without solving the problem that the method was implemented to avoid - doubling/mocking classes in such a way that I don't encounter the uninitialized constant error.

Current Status:

At this point I have code that behaves as I'd like in 108 lines of code, 19 Rspec examples,  test coverage of 98.81%, 3 different classes/spec files with isolated testing and the only line of my code that doesn't get tested is the 'stormy?' predicate method which has behaviour defined by an external class as outlined in the paragraph above.

additional tests not listed above:

Airport:
- should not land a plnae that isn't in the air
- should not launch a plane that isn't in the airport
- should not land the same plane twice without launching it inbetween.
- should not launch a plane that isn't on the ground

Plane:
- should update airborne status with landing
- should update airborne status with takeoff
- should be able to confirm if it is airborne or not

Weather:
- should be sunny more often than stormy

  I considered two other tests:
   - airport should not land other airports
   - airport should not land a plane that is in another airport

    I am not writing the first test as I do not know how to write that test for the airport class in isolation from the plane class - mocking and doubling has really been highlighted as weakpoint of mine.

    The second test has made me wonder about my edge cases - I don't feel like it's necessary as any time I land a plane I'm changing the airborne status - it's possible for me to write an example where I push the plane into one airport and land it in another, but I don't know how I would actually implement code that would cause the plane to be able to track whether it had been stored in another object,
