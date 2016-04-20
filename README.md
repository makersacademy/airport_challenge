Airport Challenge version 1 17/04/2016
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

Airport Challenege is software to control the flow of planes at an airport. The planes can land and take off provided that the weather
is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

I've writtend the program with two classes - Airport and Plane,
Airport has the methods for landing and take off. The planes are also stored within an array in Airport Class.
The Plane class has the Weather method. This is wrong and should have its own class.
The plane objects should also be stored in a hash so that the unique planes take off and land.

These issues will be addressed in the next version.


feature tests
-------------

feature test - for the purpose of the feature test the weather setter is used to change the weather as the storm method uses random method.

In normal running of the program the storm method is called on an instance of a Plane.

require "./lib/airport"
plane = Plane.new
plane.weather
plane.storm <---- here you would run the storm method.
plane.weather
plane.weather
heathrow = Airport.new
heathrow.land(plane)
heathrow.plane_holder

below the storm method is called until true...

[2] pry(main)> require "./lib/airport"
=> true
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007fa534987cc8 @weather=false>
[4] pry(main)> plane.weather
=> false
[5] pry(main)> plane.storm
=> false
[6] pry(main)> plane.storm
=> false
[7] pry(main)> plane.storm
=> false
[8] pry(main)> plane.storm
=> false
[9] pry(main)> plane.storm
=> false
[10] pry(main)> plane.storm
=> false
[11] pry(main)> plane.storm
=> true
[12] pry(main)> plane.weather
=> true
[13] pry(main)> heathrow = Airport.new
=> #<Airport:0x007fa535926378 @capacity=10, @plane_holder=[]>
[14] pry(main)> heathrow.land(plane)
RuntimeError: can't land in a storm
feature tests

-------------

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed


[2] pry(main)> require "./lib/airport"
=> true
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007f9aab16c3b0 @weather=false>
[4] pry(main)> heathrow = Airport.new
=> #<Airport:0x007f9aaa1abf20 @capacity=10, @plane_holder=[]>
[5] pry(main)> heathrow.land(plane)
=> [#<Plane:0x007f9aab16c3b0 @weather=false>]
[6] pry(main)> heathrow.plane_holder
=> [#<Plane:0x007f9aab16c3b0 @weather=false>]

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

[1] pry(main)> require "./lib/airport"
=> true
[2] pry(main)> plane = Plane.new
=> #<Plane:0x007fad6a9f74e0 @weather=false>
[3] pry(main)> heathrow = Airport.new
=> #<Airport:0x007fad6a91a108 @capacity=10, @plane_holder=[]>
[4] pry(main)> heathrow.land(plane)
=> [#<Plane:0x007fad6a9f74e0 @weather=false>]
[5] pry(main)> heathrow.plane_holder
=> [#<Plane:0x007fad6a9f74e0 @weather=false>]
[6] pry(main)> heathrow.take_off(plane)
=> #<Plane:0x007fad6a9f74e0 @weather=false>
[7] pry(main)> heathrow.plane_holder
=> []

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

[1] pry(main)> require "./lib/airport"
=> true
[2] pry(main)> plane = Plane.new
=> #<Plane:0x007fb3c21fa108 @weather=false>
[3] pry(main)> heathrow = Airport.new
=> #<Airport:0x007fb3c21c9620 @capacity=10, @plane_holder=[]>
[4] pry(main)> heathrow.land(plane)
=> [#<Plane:0x007fb3c21fa108 @weather=false>]
[5] pry(main)> heathrow.plane_holder
=> [#<Plane:0x007fb3c21fa108 @weather=false>]
[6] pry(main)> plane.weather = true
=> true
[7] pry(main)> heathrow.take_off(plane)
RuntimeError: can't fly win storm
from /Users/harrywynnwilliams/Projects/airport_challenge/lib/airport.rb:24:in `take_off'
[8] pry(main)> heathrow.plane_holder
=> [#<Plane:0x007fb3c21fa108 @weather=true>]


N.B line 6 uses a getter to set the weather for the purpose of the test


As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

[1] pry(main)> require "./lib/airport"
=> true
[2] pry(main)> plane = Plane.new
=> #<Plane:0x007f96c98f9870 @weather=false>
[3] pry(main)> heathrow = Airport.new
=> #<Airport:0x007f96c8940cd0 @capacity=10, @plane_holder=[]>
[4] pry(main)> plane.weather = true
=> true
[5] pry(main)> heathrow.land(plane)
RuntimeError: can't land in a storm
from /Users/harrywynnwilliams/Projects/airport_challenge/lib/airport.rb:14:in `land'
[6] pry(main)> heathrow.plane_holder
=> []

N.B line 4 uses a getter to set the weather for the purpose of the test

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

[48] pry(main)> require "./lib/airport"
=> false
[49] pry(main)> plane1 = Plane.new
=> #<Plane:0x007fb085280dd8 @weather=false>
[50] pry(main)> plane1.weather = false
=> false
[51] pry(main)> plane2 = Plane.new
=> #<Plane:0x007fb0842927a0 @weather=false>
[52] pry(main)> plane2.weather = false
=> false
[53] pry(main)> plane3 = Plane.new
=> #<Plane:0x007fb085238c18 @weather=false>
[54] pry(main)> plane3.weather = false
=> false
[55] pry(main)> plane4 = Plane.new
=> #<Plane:0x007fb08488ae00 @weather=false>
[56] pry(main)> plane4.weather = false
=> false
[57] pry(main)> plane5 = Plane.new
=> #<Plane:0x007fb085188f98 @weather=false>
[58] pry(main)> plane5.weather = false
=> false
[59] pry(main)> plane6 = Plane.new
=> #<Plane:0x007fb084229d68 @weather=false>
[60] pry(main)> plane6.weather = false
=> false
[61] pry(main)> plane7 = Plane.new
=> #<Plane:0x007fb0851213e8 @weather=false>
[62] pry(main)> plane7.weather = false
=> false
[63] pry(main)> plane8 = Plane.new
=> #<Plane:0x007fb0842033c0 @weather=false>
[64] pry(main)> plane8.weather = false
=> false
[65] pry(main)> plane9 = Plane.new
=> #<Plane:0x007fb0850853a8 @weather=false>
[66] pry(main)> plane9.weather = false
=> false
[67] pry(main)> plane10 = Plane.new
=> #<Plane:0x007fb08590f2a8 @weather=false>
[68] pry(main)> plane10.weather = false
=> false
[69] pry(main)> plane11 = Plane.new
=> #<Plane:0x007fb085819718 @weather=false>
[70] pry(main)> plane11.weather = false
=> false
[71] pry(main)> heathrow = Airport.new
=> #<Airport:0x007fb0842fb7f0 @capacity=10, @plane_holder=[]>
[72] pry(main)> heathrow.land(plane1)
=> [#<Plane:0x007fb085280dd8 @weather=false>]
[73] pry(main)> heathrow.land(plane2)
=> [#<Plane:0x007fb085280dd8 @weather=false>, #<Plane:0x007fb0842927a0 @weather=false>]
[74] pry(main)> heathrow.land(plane3)
=> [#<Plane:0x007fb085280dd8 @weather=false>,
 #<Plane:0x007fb0842927a0 @weather=false>,
 #<Plane:0x007fb085238c18 @weather=false>]
[75] pry(main)> heathrow.land(plane4)
=> [#<Plane:0x007fb085280dd8 @weather=false>,
 #<Plane:0x007fb0842927a0 @weather=false>,
 #<Plane:0x007fb085238c18 @weather=false>,
 #<Plane:0x007fb08488ae00 @weather=false>]
[76] pry(main)> heathrow.land(plane5)
=> [#<Plane:0x007fb085280dd8 @weather=false>,
 #<Plane:0x007fb0842927a0 @weather=false>,
 #<Plane:0x007fb085238c18 @weather=false>,
 #<Plane:0x007fb08488ae00 @weather=false>,
 #<Plane:0x007fb085188f98 @weather=false>]
[77] pry(main)> heathrow.land(plane6)
=> [#<Plane:0x007fb085280dd8 @weather=false>,
 #<Plane:0x007fb0842927a0 @weather=false>,
 #<Plane:0x007fb085238c18 @weather=false>,
 #<Plane:0x007fb08488ae00 @weather=false>,
 #<Plane:0x007fb085188f98 @weather=false>,
 #<Plane:0x007fb084229d68 @weather=false>]
[78] pry(main)> heathrow.land(plane7)
=> [#<Plane:0x007fb085280dd8 @weather=false>,
 #<Plane:0x007fb0842927a0 @weather=false>,
 #<Plane:0x007fb085238c18 @weather=false>,
 #<Plane:0x007fb08488ae00 @weather=false>,
 #<Plane:0x007fb085188f98 @weather=false>,
 #<Plane:0x007fb084229d68 @weather=false>,
 #<Plane:0x007fb0851213e8 @weather=false>]
[79] pry(main)> heathrow.land(plane8)
=> [#<Plane:0x007fb085280dd8 @weather=false>,
 #<Plane:0x007fb0842927a0 @weather=false>,
 #<Plane:0x007fb085238c18 @weather=false>,
 #<Plane:0x007fb08488ae00 @weather=false>,
 #<Plane:0x007fb085188f98 @weather=false>,
 #<Plane:0x007fb084229d68 @weather=false>,
 #<Plane:0x007fb0851213e8 @weather=false>,
 #<Plane:0x007fb0842033c0 @weather=false>]
[80] pry(main)> heathrow.land(plane9)
=> [#<Plane:0x007fb085280dd8 @weather=false>,
 #<Plane:0x007fb0842927a0 @weather=false>,
 #<Plane:0x007fb085238c18 @weather=false>,
 #<Plane:0x007fb08488ae00 @weather=false>,
 #<Plane:0x007fb085188f98 @weather=false>,
 #<Plane:0x007fb084229d68 @weather=false>,
 #<Plane:0x007fb0851213e8 @weather=false>,
 #<Plane:0x007fb0842033c0 @weather=false>,
 #<Plane:0x007fb0850853a8 @weather=false>]
[81] pry(main)> heathrow.land(plane10)
=> [#<Plane:0x007fb085280dd8 @weather=false>,
 #<Plane:0x007fb0842927a0 @weather=false>,
 #<Plane:0x007fb085238c18 @weather=false>,
 #<Plane:0x007fb08488ae00 @weather=false>,
 #<Plane:0x007fb085188f98 @weather=false>,
 #<Plane:0x007fb084229d68 @weather=false>,
 #<Plane:0x007fb0851213e8 @weather=false>,
 #<Plane:0x007fb0842033c0 @weather=false>,
 #<Plane:0x007fb0850853a8 @weather=false>,
 #<Plane:0x007fb08590f2a8 @weather=false>]
[82] pry(main)> heathrow.plane_holder
=> [#<Plane:0x007fb085280dd8 @weather=false>,
 #<Plane:0x007fb0842927a0 @weather=false>,
 #<Plane:0x007fb085238c18 @weather=false>,
 #<Plane:0x007fb08488ae00 @weather=false>,
 #<Plane:0x007fb085188f98 @weather=false>,
 #<Plane:0x007fb084229d68 @weather=false>,
 #<Plane:0x007fb0851213e8 @weather=false>,
 #<Plane:0x007fb0842033c0 @weather=false>,
 #<Plane:0x007fb0850853a8 @weather=false>,
 #<Plane:0x007fb08590f2a8 @weather=false>]
[83] pry(main)> heathrow.land(plane11)
RuntimeError: can't airport full
from /Users/harrywynnwilliams/Projects/airport_challenge/lib/airport.rb:15:in `land'
[84] pry(main)> heathrow.plane_holder
=> [#<Plane:0x007fb085280dd8 @weather=false>,
 #<Plane:0x007fb0842927a0 @weather=false>,
 #<Plane:0x007fb085238c18 @weather=false>,
 #<Plane:0x007fb08488ae00 @weather=false>,
 #<Plane:0x007fb085188f98 @weather=false>,
 #<Plane:0x007fb084229d68 @weather=false>,
 #<Plane:0x007fb0851213e8 @weather=false>,
 #<Plane:0x007fb0842033c0 @weather=false>,
 #<Plane:0x007fb0850853a8 @weather=false>,
 #<Plane:0x007fb08590f2a8 @weather=false>]


As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

[1] pry(main)> require "./lib/airport"
=> true
[2] pry(main)> plane1 = Plane.new
=> #<Plane:0x007f9b5c1edee0 @weather=false>
[3] pry(main)> plane2 = Plane.new
=> #<Plane:0x007f9b5d054808 @weather=false>
[4] pry(main)> plane3 = Plane.new
=> #<Plane:0x007f9b5c9036d0 @weather=false>
[5] pry(main)> plane4 = Plane.new
=> #<Plane:0x007f9b5c8bb240 @weather=false>
[6] pry(main)> plane5 = Plane.new
=> #<Plane:0x007f9b5c0a1f50 @weather=false>
[7] pry(main)> heathrow = Airport.new(4)
=> #<Airport:0x007f9b5c043568 @capacity=4, @plane_holder=[]>
[8] pry(main)> heathrow.land(plane1)
=> [#<Plane:0x007f9b5c1edee0 @weather=false>]
[9] pry(main)> heathrow.land(plane2)
=> [#<Plane:0x007f9b5c1edee0 @weather=false>, #<Plane:0x007f9b5d054808 @weather=false>]
[10] pry(main)> heathrow.land(plane3)
=> [#<Plane:0x007f9b5c1edee0 @weather=false>,
 #<Plane:0x007f9b5d054808 @weather=false>,
 #<Plane:0x007f9b5c9036d0 @weather=false>]
[11] pry(main)> heathrow.land(plane4)
=> [#<Plane:0x007f9b5c1edee0 @weather=false>,
 #<Plane:0x007f9b5d054808 @weather=false>,
 #<Plane:0x007f9b5c9036d0 @weather=false>,
 #<Plane:0x007f9b5c8bb240 @weather=false>]
[12] pry(main)> heathrow.land(plane5)
RuntimeError: can't airport full





Harry Wynn-Williams (harrywynnwilliams@googlemail.com)