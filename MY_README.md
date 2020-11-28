## README - Airport Challenge

### Brief
As an air traffic controller 
So I can get passengers to a destination 
##### I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
##### I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
##### I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
##### I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
##### I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
##### I want to prevent landing when weather is stormy 

### TaskList
* I want to instruct a plane to land at an airport
* I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
* I want to prevent landing when the airport is full
* I would like a default airport capacity that can be overridden as appropriate
* I want to prevent takeoff when weather is stormy
* I want to prevent landing when weather is stormy

### Steps
1) Feature test creation of a new airport
2) Write test to duplicate the error
3) Write enough code to get the test to pass
4) push to GH repo
5) Now we have an airport, FT a plane landing
6) I want to use airport.land and have that take an argument of plane.
7) I will write a UT for this and watch it fail.
8) I will write code to pass this test and watch test pass.
9) Now we have an airport.land, FT a plane taking off.
10) Before FT I want to change code to better label the land method.
11) .land will be .arrival
12) Write UT for plane.depart with one argument of plane and watch it fail.
13) Write code to pass the test.
14) push to GH repo
15) 