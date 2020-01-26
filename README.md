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

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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
Approach
--------
Based on the user stories I broke down the problem into the following steps. Before each step I created a unit test, ran Rspec to recieve a test fail, updated my code, ran rspec to recieve a pass and then refactored any code if need be.

Story 1
1. Create airport class
2. Create plane class
3. Create land method with 1 argument (Plane)
4. Update land method to a return plane
5. Make a method plane to return a plane
6. Store plane name from land method
7. Create attribute for airport to store 1 plane

Story 2
1. Create take off method with 1 argument (plane)
2. Take off method accepts 1 argument (plane)
3. Update attribute when plane takes off

Story 3
1. Update plane attribute to planes
2. Initialize an array for planes
3. Update test and land definition to allow array to push
4. Update test and take-off definition to remove plane from array
5. Updated so plane cannot land if it is already in airport array
6. Updated take_off method to raise error if plane not in planes array
7. Define Constant CAPACITY = Default value
8. Create full? Method to raise error if airport full

Story 4
1. Create an initialize method for airport to pass in airport capacity

Story 5
1. Create weather class
2. Define method for stormy?
3. Define method to return a value of true or false
4. Create weather attribute
5. Add if statement to check weather in previously defined methods before allowing plane to take-off

Story 6
1. Update methods for landing to include if statement referencing stormy?

Ideas
-----

I created an image of the logical flow for the land and take off methods when I was planning how to design the program. I came up with these control flows which then help me plan each step.

![flow diagram](https://raw.githubusercontent.com/DavidStewartLDN/airport_challenge/master/airport_challenge.jpg)

How the code will be reviewd
-----------------------------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 
