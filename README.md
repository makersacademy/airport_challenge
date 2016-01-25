Airport Challenge
=================

Week 1 Weekend Challenge
-----------------------

For the first weekend challenge, I had to create a program that controlled planes landing and taking off from airports. This was based on six different user stories. I first focused on the code allowing planes to land and take-off from an airport, which I then refined to take more complicated cases into account (such as trying to land a plane that is already landed). Following this, I set a capacity for the airport and then I looked at the effect of stormy weather on landing and taking off.

The code worked in irb like this:

    $ irb
    2.2.3 :001 > airport = Airport.new
      => #<Airport:0x007fb95381e2a0 @planes=[], @capacity=10, @weather=#<Weather:0x007fb95381e228>>
    2.2.3 :002 > plane = Plane.new
      => #<Plane:0x007fb95388c3b8 @landed=false>
    2.2.3 :003 > airport.land(plane)
      => [#<Plane:0x007fb95388c3b8 @landed=true>]
    2.2.3 :004 > airport.land(plane)
      RuntimeError: This plane has already landed.
    2.2.3 :005 > airport.take_off(plane)
      => #<Plane:0x007fb95388c3b8 @landed=false>
    2.2.3 :006 > airport.take_off(plane)
      RuntimeError: This plane is not at this airport.
