#README File
Here is my interpretation of the different user stories for this challenge.

1. As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport:

In this user story we will need an airport and a plane as objects of our story. The message will be 'to land'


2. As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport:

The message of this user story is 'to take off'. Objects are the plane and the airport. As a message, we want the plane to confirm on the question if yes or no it is still at the airport.

3. As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy:

We are using the airport and the plane as objects of this story. The message is to take off; there is a condition here, which is the weather.

4. As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy:

We are using the airport and the plane as objects of this story. The message is to land; there is a condition here, which is the weather.

5. As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full:

The condition here is the state of the airport (full or not). The airport will have to send a 'landing' message to the plane object.

6. As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate:

A certain capacity will have to be determined on our object, the airport.
