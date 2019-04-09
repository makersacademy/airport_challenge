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

Approach to Solution
---------

**Landing a plane at an airport**

- The first step I took was to write tests for creating classes for the airport and plane in the user story.

- I then wrote the tests to check that an airport instance could respond to the 'land' method with one argument, then wrote the code.

- To store the plane it would need to go into an empty array, so I initialized an empty array and made the 'land' method push the plane argument to the array.

**Taking off from the airport**

- No new classes needed to be made, so I wrote the tests for having a plane 'land' at the airport and then 'take_off'.

- Writing the code for this was relatively straightforward, just removing the plane from the hangar and returning a confirmation.

**Edge cases**

- As it stands, the plane can 'land' and 'take_off' more than once. To solve the 'land' issue, I would write code to raise an error if that instance of plane resides in the hangar array. Similarly, to solve the same issue with 'take_off', I would raise an error if that plane is NOT in the hangar.

**Stormy weather**

- To simulate the weather I created a new class 'Weather' with the method 'storm?' generating a random number between 0 and 1.

- Within the 'land' and 'takeoff' method I raised an error if the private method ('storm?') was true.

- I used stubs in the tests to mimic the return value of 'storm?'

**Capacity**

- To set a default capacity of the hangar I made a constant called 'DEFAULT_CAPACITY'. Upon initializing a new instance of the airport, it will default to the constant unless the user includes a custom amount. I did this by using a fallback argument: 'initialize(20=DEFAULT_CAPACITY)'.

- To safeguard against too many planes being in the hangar, I created a private method 'full?' which is used by the land and take-off methods. An error will be raised if capacity+1 planes are placed in the hangar.
