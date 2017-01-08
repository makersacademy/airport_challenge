User Stories and process
============

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```
Object | Message
------- | -------
air_traffic_controller |
passenger |
plane | landed?
airport | land

**Notes:**

Originally created the method to return the string "Plane has landed", but I didn't think that it fully completed met the criteria so added the .landed? method to the plane class.

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
Object | Message
------ | -------
air_traffic_controller |
passenger |
plane | take_off
airport | taken_off?

**Notes:**

Changed all the class methods that I had created. Now Airplane has the method .land which takes airport as an argument. Originally Airport was passed the .land method with an instance of plain as an argument. Had to rewrite all the tests. Created a test that checks if .take_off and .land alter the planes array in the Airport instance.

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
Object | Message
------ | -----
air_traffic_controller |
weather | stormy?
plane | take_off

**Notes:**
Decided to create a new module Weather as weather did not need instances to be created, it just needed a method to test whether it was stormy or not. Created the #self.stormy? method which randomly generates a number from 0 - 9. If the number is less than 1 the weather is considered to be stormy. Incorporated this into the #take_off method of plane by creating a method #safe. safe will evaluate to an error if the weather is stormy, or true if not.


```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
Object | Message
------ | -----
air_traffic_controller |
weather | stormy?
plane | land

**Notes:**
Made this the same as the previous test


```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
Object | Message
------- | -------
air_traffic_controller |
airport | full?
plane | land

**Notes:**

I will need to create a constant that has a default capacity and set it to a number. When the airport is full no more planes can take off or land.

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

Object | Message
------- | -------
system_designer |
airport | DEFAULT_CAPACITY

**Notes**

I want to give the capacity variable the DEFAULT_CAPACITY when no arguments are given. Have set the default initialisation of an Airport class to have the capacity 10.

```
Your code should defend against edge cases such as inconsistent states of the system ensuring
that planes can only take off from airports they are in;
planes that are already flying cannot take off and/or be in an airport;
planes that are landed cannot land again and must be in an airport, etc.
```
**Notes**

Currently, my code doesn't fit any of the edge cases. I need to rework the test to see if the plane has landed potentially to include a "status" as an instance variable that can be defined as 'flying' or 'landed'. I think when the plane has the landed status it should not be able to land and when it is flying it should not be able to take off.
