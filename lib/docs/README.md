






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

You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.
