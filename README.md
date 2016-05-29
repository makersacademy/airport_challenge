#Airport Challenge
=================

The aim of this challenge was to develop an 'airport', 'plane' and 'weather' that interacts with each other. It was not part of the challenge but this project also includes a 'traffic_control'.

###airport
Airport accepts planes to the terminal (if it is not full) when landed, and releases a plane from the terminal when plane takes off. It does not allow an empty terminal to release a plane.

The airport capacity is '10' by default but this can be changed, when a new airport is instantiated (e.g. airport = Airport.new(5))

###plane
Plane lands or takes off depending on the permission received from the traffic control. It raises an error if it has already landed/taken off and a request to land/take off has been made.

###traffic_control
Traffic_control checks the weather, and grants permission for landing or take off if weather is sunny.

###weather
Changes its weather state between sunny and stormy randomly.

##How to use it in irb?
```
1- After cloning this repository do `gem install bundle` and then `bundle` in your command line
2- Start irb
3- Require the "airport.rb" file
4- airport = Airport.new
5- plane = Plane.new
6- traffic_control = TrafficControl.new
7- weather = Weather.new
8- traffic_control.allow_landing_and_take_off_depending_on(weather)
9- plane.land(traffic_control)
10- a) if plane successfully landed: airport.plane_arrival(plane) =>        this will add the plane to the terminal.
    b) if plane did not successfully land due to stormy weather, then try again. As the weather state is random, it will land eventually.
11- airport.plane_departure(plane), should release the specific plane that is already in the terminal. It will raise an error if plane is not in the terminal.

```
