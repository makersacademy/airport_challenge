Airport Challenge
=================
Here are the user stories I was given for this design.

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
I want to be able to prevent airplanes landing when the weather is stormy
```
To do this, I created two classes: Airport and Plane.

The Plane class can return 'True' or 'False' when asked flying?, as well as being able to change it's status. Planes have their methods called by Airports, which tell them to take off or land etc. It has the methods :
 * initialize - to have it be flying when it is created
 * land! - which makes the plane return 'False' to flying?, or returns an error that it is already landed
 * take_off! - which makes the plane return 'True' to flying?, or returns an error that it is already flying

The Airport class has a capacity and an array of planes. The capacity is 20 and the array is empty when an Airport is initialised. It has a private method 'stormy_weather?' which returns true 1/4 of the time. It's main methods are:
 * land_plane(plane) - which takes a plane as an argument, changes it's status to landed, and adds it to the airport's array of planes. It gives an error if the number of objects in the airport's array is greater than it's capacity. It also gives an error if the weather is stormy.
 * plane_take_off(plane) - which takes a plane as an argument, changes it's status to flying, and removes it from the airport's array of planes. It gives an error if the airport is empty and if the weather is stormy. This function is slightly complicated by the tests needing to check that the right plane was released.

 There is a 'Grand Finale' feature test, as well as feature tests and unit tests for each class. 