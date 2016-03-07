Airport Controller
=================

```
        ______
        _\____\___
=  = ==(___ANDREW__)
        (___AIRWAYS__)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

About
---------

Here is a software to control a airport and stop any problems from arising.


Installation Instructions
---------

Here is a software to control a airport and stop any problems from arising.

```
$ git clone https://github.com/acookson91/airport_challenge.git
$ cd airport_challenge
```

Functionality
---------

**CAPACITY**

The airport capacity is defaulted to 20 planes. This can be changed if you provide a argument when creating the airport class (argument is optional). Below sets the airport to have a capacity of 50.

```
andrew_airport = Airport.new(50)
```

**WEATHER**

If the weather is stormy no planes can land or take off. To keep this as realistic as possible the weather is set randomly creating a one in five chance of stormy weather.

**LANDING**

Planes can only land in the airport if the maximum capacity has not been reached.

**TAKEOFF**

For a plane to takeoff there must be at least one plane in the airport and its status must have the status of landed.

**TAKEOFF**

For a plane to takeoff there must be at least one plane in the airport and its status must have the status of landed.
