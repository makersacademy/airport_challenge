Airport Challenge
=================

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client.

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing or taking off when the weather is stormy
```

Solution Approach
-----------------
Planes by default are "flying", and they only rely on pilots to land in order to keep track of the airport in which they land. For example:
```ruby
plane = Plane.new
=> #<Plane:0x007fdb611136b0 @landed=false>

airport = Airport.new
=> #<Airport:0x007fdb610a0368 @capacity=5, @weather="stormy", @planes=[#<Plane:0x007fdb610a0228 @landed=true>]>

plane.land airport
=> #<Airport:0x007fdb610a0368 @capacity=5, @weather="stormy", @planes=[#<Plane:0x007fdb610a0228 @landed=true>]>

plane
=> #<Plane:0x007fdb611136b0 @landed=true, @airport=#<Airport:0x007fdb610a0368 @capacity=5, @weather="stormy", @planes=[#<Plane:0x007fdb610a0228 @landed=true>]>>
```
As you can foresee, the `plane` object may start getting messy and not very readable as it drags all the `airport` class variables. Thus, once the landing is instructed from the airport's traffic control tower, `plane` will only reflect its `landed` state.

For reference, `Airport` class is initialized with a landed plane by  default. To illustrate the reason why `plane` should not pull the `airport` instance variables every time it lands (whether instructed or by itself), compare the above code with the snippet below:

```ruby
airport = Airport.new
 => #<Airport:0x007f8c0315dab0 @capacity=5, @weather="sunny", @planes=[#<Plane:0x007f8c0315da10 @landed=true>]>

plane = Plane.new
 => #<Plane:0x007f8c03145bb8 @landed=false>

airport.landing_order plane
 => [#<Plane:0x007f8c0315da10 @landed=true>, #<Plane:0x007f8c03145bb8 @landed=false>]

airport.receive plane
=> true

plane
 => #<Plane:0x007f8c03145bb8 @landed=true>

airport
 => #<Airport:0x007f8c0315dab0 @capacity=5, @weather="sunny", @planes=[#<Plane:0x007f8c0315da10 @landed=true>, #<Plane:0x007f8c03145bb8 @landed=true>]>

```
It is much cleaner like this. In terms of process flow, it was more logical to me to associate the each `plane` to each `airport` when instructed by the `airport` class. Conversely, associate each `airport` to each `plane`class when instructed by the _Pilot_