Airport Challenge: Jonathan Andrews
===================================

Development Process
-------------------

First, I extracted the Objects and the Messages from the user stories.
For each User Story, I wrote RSpec test code then I wrote code to satisfy the test.
After, working through the User Stories, I repeated the process to satisfy the requirement of defending against edge cases.
Finally, I adapted my tests to use Doubles and Method Stubs to eliminate dependency.

IRB Feature Test
----------------

```
$ irb
2.5.0 :002 > gatwick = Airport.new
 => #<Airport:0x00007ffea801e560 @hanger=[], @capacity=20>
2.5.0 :003 > heathrow = Airport.new
 => #<Airport:0x00007ffea783d350 @hanger=[], @capacity=20>
2.5.0 :004 > luton = Airport.new(1)
 => #<Airport:0x00007ffea7844678 @hanger=[], @capacity=1>
2.5.0 :005 > ba = Plane.new
 => #<Plane:0x00007ffea7836730 @location="The Factory">
2.5.0 :006 > easyjet = Plane.new
 => #<Plane:0x00007ffea782aa98 @location="The Factory">
2.5.0 :007 > ryanair = Plane.new
 => #<Plane:0x00007ffea7826880 @location="The Factory">
2.5.0 :008 > gatwick.take_off(ba)
 => "Airborne"
2.5.0 :009 > gatwick.take_off(easyjet)
 => "Airborne"
2.5.0 :010 > gatwick.take_off(ryanair)
 => "Airborne"
2.5.0 :011 > gatwick.take_off(ba)
RuntimeError (Cannot take off. Plane already airborne)
2.5.0 :012 > luton.land(easyjet)
 => [#<Plane:0x00007ffea782aa98 @location=#<Airport:0x00007ffea7844678 @hanger=[...], @capacity=1>>]
2.5.0 :013 > heathrow.land(ryanair)
 => [#<Plane:0x00007ffea7826880 @location=#<Airport:0x00007ffea783d350 @hanger=[...], @capacity=20>>]
2.5.0 :014 > luton.land(ba)
RuntimeError (The plane can't land because the hanger is full)
2.5.0 :015 > heathrow.land(ryanair)
RuntimeError (Cannot land. Plane already on the ground)
2.5.0 :016 > heathrow.takeoff(easyjet)
2.5.0 :017 > heathrow.take_off(easyjet)
RuntimeError (Plane at wrong airport)
```
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
