# Airport challenge

Work done for the week 1 challenge for [Makers Academy](http://www.makersacademy.com)

I broke the challenge down into its User Stories and tried to tackle them one at a time. I left the weather User Stories until the end as they seemed like extra tasks that could be implemented once the rest of the user stories were written and tested.

I used TDD best practices: feature test, unit test, code.

## Example app usage in irb
```
➜  airport_challenge git:(master) irb
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > heathrow = Airport.new
 => #<Airport:0x007fc60d91c0f0 @planes=[], @capacity=20, @weather=#<Weather:0x007fc60d91c0c8>>
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fc60d8bd938 @flying=true>
2.2.3 :004 > heathrow.land(plane)
 => [#<Plane:0x007fc60d8bd938 @flying=false>]
2.2.3 :005 > heathrow.take_off(plane)
 => #<Plane:0x007fc60d8bd938 @flying=true>
```
