Airport Challenge
=================

The first individual weekend challenge at Makers Academy.

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

How The Programme Works
-----

The programme allows users to create instances of planes and airports.

Airports are able to keep track of planes that have landed in them. They also have a default capacity of 10 planes, which can be changed when the user creates a new airport, by passing in an optional argument.

Planes are able to take off and land in airports. When instructing a plane to take off or land, the user must specify which airport they are leaving or entering. Taking off will fail if the plane is not in the specified airport, and landing will fail if the plane is not currently in the air. If take off and landing are successful, the user will receive a confirmation message. Additionally, if the specified airport is at full capacity, the plane will be prevented from landing. The user will always be notified why the attempted instruction has failed.

The weather is simulated with a random 'stormy weather' generator. Weather will be stormy 30% of the time. When the weather is stormy, planes will not be able to take off or land.

How To Use
-----
* Airport.new   # creates a new airport:
* Airport.new(20)   # sets the capacity of an airport to 20
* Plane.new   # creates a new plane:
* plane.land(airport)   # lands a plane in an airport
* plane.take_off(airport)   # makes a plane take off from an airport:

Example usage
-----
![Alt tag](https://github.com/FloraHarvey/airport_challenge/blob/master/Screenshot%202017-02-20%2010.38.09.png)

Struggles I encountered
-----
* Testing the right thing: when one class has a method that has a result on another class, I was sometimes unsure which class I should be testing. If I had more time I would like to decouple the classes further so that, for example, the plane.land method calls an airport.add_plane method, rather than directly adding planes to airport.
* Using doubles: a related problem I had was using doubles when testing the above method. I found that the classes were too interlinked to use a plane double in the airport test.
