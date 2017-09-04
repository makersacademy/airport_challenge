Airport Challenge - Tasked 01/09/17; Completed 04/09/17
=================

```
        ______
        _\____\___
=  = ==(___RORY___)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Instructions
-----
1. To create a new airport, run Airport.new and assign it to a variable (e.g. airport1 = Airport.new)

2. To create a new plane, run Plane.new and assign it to a variable (e.g. plane1 = Plane.new)

3. To land a plane, run the #land method on the airport you want to land at, with the plane as an argument - e.g. airport1.land(plane1)

4. To take-off a plane, run the #take-off method on the airport you want to take-off from, with the plane as an argument - e.g. airport1.take_off(plane1)

  - Note, a quirk in this program means that it doesn't matter which airport you specify, planes will always take-off; so, only use this to instantiate one airport at a time

  - Note, it is also very stormy at this airport, so you might need to try landing and taking-off a few times while waiting for the storm to clear

5. To confirm a plane has left an airport, call #report_status method on that plane

6. To found out where a plane is exactly, call #find_the_plane on that plane.

Original Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

My Approach
-----

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

Outstanding Issues
-----

- Planes can take-off from airports they're not at
  - I made some headway on this by creating a hash where we can then define what airport each plane is at, and set rules around it
  - I made this headway by just creating a much more simple method that simply reports where a plane is at, in the Plane class -- this works, although fails rspec due to a Double leak issue that I need to figure out

- I'd prefer this all to run through an interface in a later version, rather than the user calling direct methods
