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
My approach
-----

From the user stories, there are two key objects: plane and airport. All messages/methods will act on these two objects. Therefore, create a file for each in lib, spec and define airport class and plane class. I later decided I would need a Weather Class to determine when weather is stormy/sunny, although I did wonder if I should have injected this as an attribute value for Plane initialize rather than Airport initialize

Define methods depart and land. Land will take one argument, so test for this.
When plane departs, the depart method will need to show that the plane is no longer in the airport. This can be done by initializing Airport instances with a "Planes" state recording/storing how many planes are within the airport at any given time. As planes land and depart, the Planes variable will change accordingly. This Planes variable will need to be a collection so it can store multiple instances of Plane e.g. an array.

In my final commit, I made a change to the depart method and ran out of time to resolve the test passing. Need to work on this.



Question: I wasn't sure of the best place in my code to be setting the weather. Surely the weather needs to be set every time we run the depart and land methods, but I also felt it needed its own class? Would be grateful of feedback/advice on this. In my current code, the weather is only being set/randomly generated when we instantiate a new Airport, but surely it should be generated everytime a plane lands or departs... how to account for this?

Question: Support/advice on how to write feature_spec files would be appreciated.

Question: Not sure I've "defended against edge cases" sufficiently? How to do this?
