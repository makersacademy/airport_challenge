[![Build
Status](https://travis-ci.org/travis-ci/travis-web.svg?branch=master)](https://travis-ci.org/travis-ci/travis-web)

# The Airport challenge:

The part of the challenge that I was not able to complete is the requirement to defend for edge cases state as follows "Your code should defend against edge cases such inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc."

My current code contains the method land which handle the plane landing, the method take_off for managing taking off, full? which ensure the airport handle planes according to its capacity and stormy? which checks for the weather condition before landing or taking off.My approach to solve this part will be to create an array called flying_planes, and add to it planes that take off from the airport. When the method take_off is called on a plane object, I will check the flying_planes array to see whether its object_id is included in the array.  

If it is then the method take_off will throw an error. Similarly, when a plane lands it will be recorded in the @planes array, when the method land is called on a plane object, @planes array is checked to confirm that the plane has landed before it can take off again. This same approach will be used to make sure planes will take off only from airport they are in as the airport @planes array has to include the plane before it can take off or land there.




### airport.rb feature test
```
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007f844432bcc8 @capacity=1, @planes=[]>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007f84442d8870>
[4] pry(main)> airport.land(plane)
RuntimeError: You cannot land due to bad weather
from /Users/Basile/Desktop/makers_2017/projects/airport_challenge/lib/airport.rb:20:in `land'
[5] pry(main)> airport.land(plane)
=> [#<Plane:0x007f84442d8870>]
[6] pry(main)> airport.take_off(plane)
RuntimeError: You cannot take off due to bad weather
from /Users/Basile/Desktop/makers_2017/projects/airport_challenge/lib/airport.rb:25:in `take_off'
[7] pry(main)> airport.take_off(plane)
=> #<Plane:0x007f84442d8870>
[8] pry(main)>
