Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____FC____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Approach & Progress
---------

* Planned on following a TDD approach as seen in the [Boris Bikes](https://github.com/makersacademy/course/blob/main/boris_bikes/0_challenge_map.md) challenge.
* See below the Domain Model and the desired Feature Tests.
* I have implemented the tests and the code for the first three user stories.
* I have set a default capacity (4th User Story) but could not find a good way to test (commented out the part of the `airport_spec.rb` file that was causing issues).
* For the last two User Stories (weather conditions), I think I have an idea on how to implement tests and code, but I ran out of time.

---

Domain Model
-------

I have identified these Objects and Messages from the User Stories provided:

Objects | Messages
--- | ---
plane | land, lift, flying?
airport | empty?, full?
weather (rand) | stormy?

Desired Feature Tests
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

>As an air traffic controller
>So I can get passengers to a destination
>I want to instruct a plane to land at an airport

```
> airport.land(plane)
=> nil
```

>As an air traffic controller
>So I can get passengers on the way to their destination
>I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
> airport.lift(plane)
=> "Plane has taken off and is no longer in airport"
```

>As an air traffic controller
>To ensure safety
>I want to prevent landing when the airport is full
```
> airport.full?
=> True
> airport.land(plane)
=> "Airport full! Plane cannot land"
```

>As the system designer
>So that the software can be used for many different airports
>I would like a default airport capacity that can be overridden as appropriate
```
> capacity = 20
=> 20
> capacity = 40
=> 40
(not sure about this)
```

>As an air traffic controller
>To ensure safety
>I want to prevent takeoff when weather is stormy
```
> weather.stormy?
=> True
> airport.lift(plane)
=> "Plane cannot take off"
```

>As an air traffic controller
>To ensure safety
>I want to prevent landing when weather is stormy
```
> weather.stormy?
=> True
> airport.land(plane)
=> "Plane cannot land"
```
