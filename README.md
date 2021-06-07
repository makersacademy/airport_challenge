Airport Challenge
-----

Task
-----
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
This user story requires an Airport class with a method inside that will land a plane. Here an empty array is needed where the new instances of plahnes will be put into to measure against the airport capacity later.

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
This user story requires an Aiport class with a method that will allow a plane to take off and a Plane class with a method to confirm that it has taken off and no longer at the airport.

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
This user story requires an Airport class and the same method used in the first user story can used again to return an error when a plane is trying to land but the airport has reached its capacity. 

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
This user story requires an Airport class and a test that will overwrite the default capacity set in the code.

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```
This user story requires 2 classes (Airport and Weather). The Weather class will need to randomly generate a type of weather and it then needs to be required in the Airport under the take off method so it returns an error if the weather is stormy when a plane is trying to take off.

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
This user story requires 2 classes (Airport and Weather). The Weather class will need to randomly generate a type of weather and it then needs to be required in the Airport under the landing method so it returns an error if the weather is stormy when a plane is trying to land.

-----

The code and its tests are not finished fully and there are a few tests which need to be rewritten to make it more efficient and I am planning on doing this work this week. 