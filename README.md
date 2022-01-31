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

My Approach to Solving this Challenge
---------
Throughout this challenge, I followed the TDD approach. For each user story, I wrote a feature test to generate the error message. Then I followed up with a unit test to matched the error message from the feature test. From here, I would write the code to pass each of the unit test. Once I am satisfied that all unit tests have been passed, I proceeded to run the feature test to ensure the individual user story has been met.

Whilst I completed user stories 1 and 2 and am confident that I completed it correctly. I made attempts on the other user stories (I completed user story 3 but am unsure if I did it correctly), but was not able to complete them. 

I found that I have a vague idea of how to write the code however, when it came to writing the test, it was a little more difficult. I have made attempts on writing the tests for the remaining user stories which have been commented out.

To complete the challenge, I understand that I need to do the following:
* randomly generate the weather conditions to indicate whether the plane can land or takeoff (due to stormy conditions).
* incorporate a method stub.
* counter/array to push or remove the plans during landing or takeoff.

Instructions
---------

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.
