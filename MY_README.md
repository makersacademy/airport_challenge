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
15) In order to track whether and airport is full I will need some way of tracking this.
16) I want to use an array to track this so I want to FT using an array to store landed places and to be able to read the array contents when called.
17) I will design a UT to test for whether hangar can be called on aiport and whether, when initialized, the hanger capacity should be at zero and watch it fail.
18) Now write the code to pass the tests.
19) I also want to write  a UT to make sure that when a plane arrives and leave this is recorded in the hangar array and can be displayed.
20) Pass these tests.
21) I order to meet the brief I will impose a maximum capicity of 5 to the airport so that point three in the TaskList will be met.
22) First I want to test when I give the hangar 3 planes and 5 planes (capacity) no issues arise.
23) The tests both pass as no limit has yet been imposed.
24) Now I want to raise an error when planes are added and the hangar is at capacity.
25) I will UT this.
26) I will write an if/else statement to check hangar before allowing planes.
27) Watch the test pass.
28) UT for edge cases and try to pass one thousand planes into the array and see if that causes the error to be raised.
29) push to GH repo