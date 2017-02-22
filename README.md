Airport Challenge
=================

## Process:

I created an Airport class, empty Plane class and a Weather module. I decided to keep Weather as a module instead of a class as I could then include the methods in my Airport class. If I were to have used Weather as a class I could have initialized the storminess every time Airport is instantiated. However with this approach I could not find a terse way of checking the stormy? method inside of the Airport class.

The error handling is based on checking the passed plane against the plane array within the airport and against max capacity, as well as checking for storminess.

```
$ irb
irb(main):001:0> require './lib/airport.rb
=> true
irb(main):002:0> port = Airport.new
=> #<Airport:0x007fb90610e7a0 @capacity=10, @plane_arr=[]>
irb(main):003:0> plane = Plane.new
=> #<Plane:0x007fb90601c6f8>
irb(main):004:0> port.instruct_to_land(plane)
=> #<Airport:0x007fb90610e7a0 @capacity=10, @plane_arr=[#<Plane:0x007fb90601c6f8>], @plane=#<Plane:0x007fb90601c6f8>>
irb(main):005:0> port.confirm_landed(plane)
=> "#<Plane:0x007fb90601c6f8> has landed."
irb(main):006:0> port.take_off(plane)
=> []
irb(main):007:0> port.confirm_takeoff(plane)
=> "#<Plane:0x007fb90601c6f8> has taken off."
```

An edge case still exists where if confirm_takeoff is called passing in a plane which has never been at the airport, it will report that it has taken off. Perhaps this is just a badly worded return string, or maybe there should be a "planes that took off" array to check against so the airport has a log of the coming and goings.

All tests are grouped by context.
The planes array is viewable from outside as some tests were built to rely on checking the size/if a plane is within the array, but this can be removed from the Airport class and will not result in any operational change.
