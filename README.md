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

Task
-----

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

Steps
-------

1. Clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. To run tests, run `rspec`

Approach taken to solve this Challenge
-------

1. I read the user stories
2. Wrote down all the nouns (Airport, Plane, Weather, Passenger) in the User Stories.
3. Wrote down all the verbs (land, take_off, change_capacity) in the user stories.
4. Organised the nouns and verbs into Objects and Messages

| objects | Messages |
| --- | --- |
| Passenger |  |
| Airport | land, take_off, change_capacity|
| Plane |  |
| Weather |   |

5. Wrote down arguments taken by each message and return value
6. Wrote down feature tests and unit tests for messages in objects.
7. Wrote implementation for messages to pass tests specified in step 6.
8. Added more tests to check edge conditions.
9. Added guard conditions and corresponding tests.
10. Also added bonus feature test.
