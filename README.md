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
I want to instruct a plane to land at an airport and confirm that it has landed

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

How The Programme Works
-----

The programme allows users to create instances of planes and airports.

Airports are able to keep track of planes that have landed in them. They also have a default capacity of 10 planes, which can be changed when the user creates a new airport, by passing in an optional argument.

Planes are able to take off and land in airports. When instructing a plane to take off or land, the user must specify which airport they are leaving or entering. Taking off will fail if the plane is not in the specified airport, and landing will fail if the plane is not currently in the air. If take off and landing are successful, the user will receive a confirmation message. Additionally, if the specified airport is at full capacity, the plane will be prevented from landing. The user will always be notified why the attempted instruction has failed.

The weather is simulated with a random 'stormy weather' generator. Weather will be stormy 30% of the time. When the weather is stormy, planes will not be able to take off or land.

How To Use
-----
To create a new airport:
Airport.new
To set the capacity of an airport:
Airport.new(capacity)
To create a new plane:
Plane.new
To land a plane in an airport:
plane.land(airport)
To make a plane take off from an airport:
plane.take_off(airport)

Example usage
-----
![Alt text](/Users/floraharvey/Downloads/Screenshot 2017-02-20 10.38.09.png)

Suggested Future Extension
-----
With more time, I would like to allow the user to add further properties to airports and planes, such as flight number. I would like to
