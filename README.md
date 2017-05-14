# Airport Challenge
=================

This project emulates an air traffic control system - it allows the user to create Airport and Plane objects, and instruct planes to land and take off from airports.  The user can also specify a planes capacity when creating a new airport (otherwise a default of 10 is set) and can override that capacity later if they wish.  A random number generator emulates the weather, and take-offs and landings are prevented if the weather is "stormy".

#

This challenge was completed in a TDD (test-driven development) manner, meaning I wrote a test for what I wanted the program to do, then wrote the code to satisfy that test, and repeated the process.

## Approach

Six user stories were presented to define the requirements of the finishing project, so my first step was to decide which order to tackle them in, and complete them one by one.  I chose the following order:

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

This seemed like the best place to start, because the capacity would be defined when the airport object was instantiated.  By setting this up first, I was able to see what limitations my code would have.  I used a constant to store the default capacity of 10 in, to prevent "magic numbers" existing in my code.  This constant was used in my tests as well.

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```

These two stories are very similar, so it made sense to do them one after the other, but I could see they needed to be done before the remaining stories, which would rely on these functions working properly.  I set up #take_off and #land methods from the Plane class, as well as setting up an instance variable `@in_airport` so that the plane could confirm its status.

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

When I began to address this story, I realised that my Airport and Plane classes would need to be able to send and receive information to each other somehow (I would need the plane's information to store in a list of planes at the airport, but needed to not make the airport's plane list accessible outside of the Airport class).  I set up #land and #take_off methods for the Airport class, and updated the Plane methods to call these.  Once I understood that raising an exception from the Airport method would prevent the Plane method from completing (so it would not change its @in_airport status), I was happy enough with this arrangement.

```
As an air traffic controller
To ensure safety
I want to prevent [takeoff/landing] when weather is stormy
```

To satisfy this user story I set up another instance variable in my Airport class.  Since the Airport object should be responsible for *checking* the weather, but not for *determining* the weather, I set up a Weather class which contained a method with a random number generator `rand(10) < 3` giving a 30% chance that the weather would be "stormy".  My Airport#land and #take_off methods then simply had to refer to this method at first and raise an exception to prevent any action if the weather was stormy.

#

After satisfying all the user stories, I set about tidying up my code and defending against edge cases.  I removed some early tests which were redundant, such as a few for the Plane class which simply expected it to respond to certain methods, and one which tested that the "airport should indicate that it is full" (no longer needed as I was already testing that an exception was raised if trying to land a plane at a full airport).

I realised that my raise methods for when trying to land at a full airport, or trying to take off from the wrong airport, were in different classes.  I moved these all to the airport class so that all my guard cases(?) were in the same place.  I also wanted the Airport#full? method to be able to be private.

After more feature testing in irb, I noticed it was possible to call the Airport#land and Airport#take_off methods directly to the airport, which would result in a plane being with a status of @in_airport = false being added to the list of @planes in the airport.  I knew that private methods would not make this possible, so I did some research to find out if I could set up a method which can be called by a specific class, but not outside of the classes I wanted to have access.  I found out about the .send(method) command, and began working this into my code so that the Plane class could call specific Airport class methods, but then realised I would have to use this in all of my airport_spec tests as well, which told me it was probably not a good practice (as testing private methods is generally not done, but then over half of my Airport class would be untested).

Since the Airport#take_off method was fairly secure since it already raised an error if the plane argument was not at the airport, I played around with having the Airport#land method raise an exception if it was passed an object other than an instance of Plane, but again this made my spec tests fail (because my plane doubles were not real Plane objects), and I could not figure out a way to test this method without un-isolating the tests.  I considered adding a #check_plane method to remove a non-plane object from the list, but this would have interfered with my unit tests as well, since they relied on checking the list at the end to ensure the plane landing was successful.

I would have liked to find a way to completely prevent those airport methods from being called outside of the Plane class, but in the end I settled with renaming the Airport methods to #try_allow_take_off and #try_allow_land, to slightly lower the chance that the user might call those methods directly on the airport.  I was happier to leave this as it was, as opposed to using lots of private methods, and #send methods to get around them.
