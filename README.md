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

*My thought process when solving these problems...*

We have 6 user stories. Lets approach them one at a time, build the test that should test for this user story, and then build the code based on the failed test.

*1.
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport*

create a test that:
checks that airport has a plane..
when the land method has been applied to plane
ok, first we need to create a Plane
then we need to land that plane
then we need to check the airport has that Plane

It may sound counter-intuative, but I think the land method should be in the Airport class, not plane class
So it says to the plane "hey plane, come and land at my airport."

*2.
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport*

at the moment, we have to take the assumption that we can only let the most recent plane that landed, take off
We also have to assume that the aiport starts empty
consequently we need to land a plane before it can take off
so airport.take_off needs to return and remove the last plane in the planes array
I think we need 2 tests here:
1 checks that the plane that has taken off is indeed a plane
2 checks that the plane is no_longer in the airport.

n.b. what we've created here is a test that checks that the airport is empty after the plane takes off which is not correct if there is more than one plane. how can we improve this?
How about we search the planes array for the plane object?
Sounds dreamy, lets do that.

*3.
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy*

is weather an object? or is a method that either returns stormy or sunny.. I think the latter... .weather should return stormy or sunny.
Hence, weather is a method of the airport class since it tells us something about the state of the airport

tests:
1 check the weather can be called
2 if the weather is stormy (randomise this) try to call take_off on airport. this should fail

for number 2, I think we are going to need to create a mock in order to ensure that the weather is stormy
Ah yes, in fact we need to create a stub. Glorious.

*4.
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy*

seems similar to 3 if anything easier
tests:
-  check let_plane_land method fails when weather is stormy
- alter let_plane_land test to work when weather is sunny

*5.
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full*

how  big is the airport? pretty f*cking small! only fits one plane (we assume at first)

tests:
set airport.full == full using sub
actually, don't need a sub, can just land one plane
check let_plane_land fails due to fullness

*6.
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate*

And our airport has just grown exponentially. Will need to alter a few tests to allow for this.
I want to set a capacity default as 20
I want to make this overidable

How shall I test this?
1. check that the default capacity is 20
do this by landing 20 aircraft and calling an error on the 21st
2. overide the capacity
land capacity aircraft and call an error on capacity + 1

*Next section: edge cases.*
Test that:
1. planes can only take off from airports they are in
2. planes that are already flying cannot takes off and/or be in an airport
3. planes that are landed cannot land again and must be in an airport, etc.

lets go one by one
*1. planes can only take off from airports they are in
hmm. we could land a plane in subject, then create a new instance of airport and try and get that same plane to take off, and say it should be a fail.*

This should be an action on take off.
Actually we could make our project better with this test. At the moment any object can take off.
Let take_off take an argument which has to be in the plane array for take_off to work

*2. planes that are already flying cannot takes off and/or be in an airport*

hmm. in order to be sure a plane is flying I guess we have to land it and then let it take off. I have already built tests to cover this.

*3. planes that are landed cannot land again and must be in an airport, etc.*

ok this is new. we need to raise an error for calling let_plane_land twice on the same plane

All seems to work... splendid. 
