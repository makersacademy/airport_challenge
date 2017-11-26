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

Instructions
---------

This is the first weekend challenge for my course at Makers Academy. I have been asked to build an airport with the client's requests below.

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

My task is to test drive the creation of a set of classes to satisfy all the above user stories. I have used a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In my tests, I have used a stub to override random weather to ensure consistent test behaviour.

My code has defended against the edge cases below:
* The plane cannot land if it is not flying
* Once the plane has landed, it shows in the airport
* Once the plane has landed, its status is changed to not flying
* Planes cannot take off if there are no planes in the airport
* Once the plane has taken off, its status is changed to flying
* Once the plane has taken off, it is no longer showing in the airport

I have create separate files for every class and test suite.

In my code review I have achieved:

* All tests passing
* 100% Test Coverage
* I have not had the chance to refactor yet but will do it next week.

### My Steps

1 - I have started by drawing a Domain model of the user stories. Then I started each user story by writing a feature test on pry and translating it into a unit test on atom with rspec. I watched the test fail first and made it pass before starting the process over again for the next user story.

2 - The Plane class has to be initialized and its state has been set to flying when initalized. It can be changed at a latter time with the state method.

3 - The Weather class contains a method called stormy? which returns a boolean for stormy weather 20% of the time and not stormy 70% of the time.

3 - The Airport class has to be initialized with a weather condition, an empty array representing the planes in the airport and a capaity (which has been defaulted to 20 but can be set to any other numbers). It contains 2 public methods which are landing and take_off and 3 private ones which are empty?, stormy? and full? The public methods allow planes to land or take off from the airport and the private ones check the state of the airport (with empty? or full?) and the weather forecast (with stormy?)
