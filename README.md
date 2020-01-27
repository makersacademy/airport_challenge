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

This is the first weekend challenge of the Makers Academy course, this task built upon what we had learnt about RSpec this week on our course and use the TDD process to design the software. We were given a set of user stories to translate into requirements for the program. The requirements included the airport being able to tell planes to take off and land. If there were issues with the weather or the capacity of the airport having been reached already, then the planes were not allowed to take off or land. The user stories on which we designed the software are show below:

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
The Approach
-------------
The Test-Driven Development software development process, where you use the `RED-GREEN-REFACTOR` code writing process is used. The test must be written before any code is written and a failure must be recieved from the testing library (RSpec in this case). Then the most basic and naive code is written to fufill the test so that it passes (GREEN) and then following this the code is refactored to increase conciseness. In this coding challenge I have aimed to 100 % test coverage so that all lines of code have been tested to mximise my confidnence in the code.

How to use
----------
1. Fork and clone the repository
2. Navigate into the parent file that contains spec and lib folders
3. To run the softeware in the Interactive Ruby Shell `irb -r './lib/airport.rb'`
4. Start by initializing a new airport `airport = Airport.new(Airport_Capacity)`
5. Initialize a plane to land or take off at an airport of you choice. `plane = Plane.new`
6. Then land and take_off airplanes to you hearts content using the methods `.land(plane)` `.take_off(plane)` on a airport of your choosing!
7. Happy flying, just watch out for the weather!

Planning
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

Diagram
---------

I created an image of the logical flow for the land and take off methods when I was planning how to design the program. I came up with these control flows which then help me plan each step.

![flow diagram](https://raw.githubusercontent.com/DavidStewartLDN/airport_challenge/master/airport_challenge.jpg)

Contributors
-----------------------------
Jason Wong's design for weather patterns was used for inspiration to control the `Weather.stormy?` method due to issues using my original code design.
