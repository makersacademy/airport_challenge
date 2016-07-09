[![Build Status](https://travis-ci.org/hannako/airport_challenge.svg?branch=master)](https://travis-ci.org/hannako/airport_challenge)

#Airport_Challenge

This program is a Makers Academy weekend challenge.
It controls the flow of planes to and from an imaginary airport, dependent on weather conditions and airport capacity.

Technologies used

##How to Use:

```
$ irb
2.2.3 :001 > airport = Airport.new
 => #<Airport:0x007fafdb81ea88 @capacity=1, @planes=[], @weather=#<Weather:0x007fafdb81ea60>>
2.2.3 :002 > plane = Plane.new
 => #<Plane:0x007fafdb0041b8>
2.2.3 :003 > airport.land(plane)
 => #<Airport:0x007fafdb81ea88 @capacity=1, @planes=[#<Plane:0x007fafdb0041b8>], @weather=#<Weather:0x007fafdb81ea60>>
2.2.3 :004 >
```
