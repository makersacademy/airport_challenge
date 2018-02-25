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
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

|    Objects   | Messages |
| ------------ | ----------- |
|   Air traffic controller   |             |
|   Plane     |  status  |
|   Airport   |     land(plane), take_off(plane), full?        |

**How I handled the weather component:**

 I made an attribute called weather which is equal to an array.sample. Then I would raise an error if you try to land or take off when the weather = "stormy". For the rspec tests, I just set the weather to sunny so it wouldn't affect the tests.

**How I stopped you taking off planes which are in the air or taking off planes from an airport they are not docked in:**

 I gave the plane class an attribute called status, which was 'air' when in the air and was set to the airport it landed in when it was on the ground. This meant that when you tried to take off a plane from an airport its status had to be equal to the airport you are trying to take it off from.
