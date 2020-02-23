# AIRPORT CHALLENGE. WEEK 1. MAKERS

## APROACH TO THE SOLUTION.
I have approached the solution to this challenge following the guide provided in the walkthrough available in the Boris Bikes aftnernoon challenge, week 1.
Briefly the main phases to reach the solution has been:

## Domain Model
 - Recognise in the different user stories the nouns and the verbs  and establish the class and methods (objects and messages), necessaries for the implementation.
 - I have decided to use 2 classes, AirPort and Plane, using mainly the Airport Class.
 - My approach has followed the TDD development, using the technique RED-GREEEN-RED.
 - For every step, i have run in this order, the feature test, the Unit Test and finally i have implemented the code.

## Methods and strategies.

Following the client demands i have developed the following :

1. Method Land(plane)....to allow a plane to land when the airport is not full and there is no storm.
2. Method takeoff , to allow the take off of a plane when there is no storm. ( I have assumed since the beginning that the airport starts with  1 airplane inside to take off).
3. Different methods to identify the storm and generate randomly the weather.
3.1 To generate the weather i have implemented a method to pick a random number in a range from 1 to 10, being TRUE one of the numbers, and selecting the value TRUE as the storm presence.
4. Using Initialize and a Constant i have implemented as requested one capacity since the beginning of 10 planes (not Heathrow airport precisely) being possible to change that capacity since any object of the Airport Class is initialised with that constant, a simple change in the code Override the value and as assigning one of our choice.
5. Finally to override in the individual test the different conditions if the airport is full, is there is a storm, etc... I have used Method stubs to return values and be able to access seconds conditions in the code.

## END

p.s Special thanks to Jara Santamaria and Stephan Ellenberger. Without them it would have  being impossible to finish this challenge on time.
