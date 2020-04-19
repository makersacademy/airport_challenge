Airport Challenge
=================

My approach:

To solve this problem I created 3 different classes: Plane, Airport and Weather.

Plane - this class controlled the landed has 3 methods.

An initialize that created the current airport instance variable which is used to track the location of the plane but is initially set as an empty string.

A land method, which takes the an instance of the Airport class as an argument to represent which airport the plane is landing in. It checks whether the plane is in the air or not (i.e. black current airport variable). It also calls the airport capacity method to check if the airport is full (will raise an error if so). If it passes these initial tests the plan will land and in doing so add to the airport planes instance variable used to track which planes are currently grounded at that airport, it also puts a message letting the user now the plane has landed at the specified airport. I appreciate this does not adhere to SRP, and if I had time to do so I would've refactored the code.

The final class was takeoff, which deleted the plane from the planes instance array of the airport instance, reset the current airport status for the plane and let the user now the plane had taken off successfully.

The weather class - had one method which randomly generated weather in the form of a string.

The airport class. Has an initialize method which created an empty instance array called planes which tracked the planes currently at that specific airport and also set capacity which defaults to 5 unless stated otherwise. Also has a planes count method to tell the user how many planes are currently at the airport.

PLEASE NOTE - I did not have time to finish the exercise, my next steps would be to firstly to create a method to make sure planes don't land or take off when the weather is stormy. Also I would refactor my current code making sure it added to SRP plus would assess if any method needed to be made private.
