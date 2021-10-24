Airport Challenge
=================

For this challenge, I took what I learnt from the Boris Bikes pair programming exercise.
I noticed that the the interactions between the airport and plane(s) were very similar to the docking station and bike(s), so I decided to implement 2 classes: Aiport & Plane and a module called Weather which just deals with randomly setting the weather conditions.

I managed to get each user story implemented and for the related tests to pass.


I didn't manage to account for the edge cases of preventing an airborne plane from taking off or a landed one from landing.

The logic I thought to apply:
-----------------------------
  For landing:
  * if the plane flying status is false, fail
  * else land
  * set plane flying status to false

  For taking off:
  * if the plane flying status is true, fail
  * else take off
  * set plane flying status to true


To run in IRB:
--------------
```ruby
3.0.2 :001 > require './lib/airport.rb'
 => true 
3.0.2 :002 > require './lib/plane.rb'
 => false 
3.0.2 :003 > require './lib/weather_report.rb'
 => false 
3.0.2 :004 > airport = Airport.new
 => #<Airport:0x000000010501dcd0 @plane_capacity=50, @planes=[], @weather=true> 
3.0.2 :005 > plane = Plane.new
 => #<Plane:0x000000010501dd98 @flying=true> 
3.0.2 :006 > airport.land(plane)
 => #<Plane:0x000000010501dd98 @flying=false> 
3.0.2 :007 > airport.take_off(plane)
 => #<Plane:0x000000010501dd98 @flying=true> 
```
