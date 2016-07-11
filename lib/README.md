[![Build Status](https://travis-ci.org/hannako/airport_challenge.svg?branch=master)](https://travis-ci.org/hannako/airport_challenge)

#Airport_Challenge

This program is a Makers Academy weekend assignment.
It controls the flow of planes to and from an imaginary airport, dependent on weather conditions and airport capacity.

###Build Status: WORK IN PROGRESS
Method stub to fix weather conditions is not working, so the tests are failing randomly. All user stories addressed.
Unit test coverage needs to be improved and code needs to be refactored

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
