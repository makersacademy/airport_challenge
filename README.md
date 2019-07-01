## README

[1] pry(main)> airport = Airport.new
=> #<Airport:0x00007fb3f7be4878
 @max_capacity=20,
 @planes=[],
 @weather=["stormy", "sunny", "sunny", "sunny", "sunny", "sunny"]>
[2] pry(main)> plane = Plane.new
=> #<Plane:0x00007fb3f8312d98>
[3] pry(main)> airport.instruct_land(plane)
RuntimeError: Permission to land denied due to stormy weather
from /Users/Ganney/Projects/Portfolio/week1/airport_challenge/lib/airport.rb:18:in `instruct_land'
[4] pry(main)> airport.instruct_land(plane)
=> [#<Plane:0x00007fb3f8312d98>]
[5] pry(main)> airport.instruct_take_off
#<Plane:0x00007fb3f8312d98> has successfully taken off
=> []
[6] pry(main)> 10.times { airport.instruct_land Plane.new }
RuntimeError: Permission to land denied due to stormy weather
from /Users/Ganney/Projects/Portfolio/week1/airport_challenge/lib/airport.rb:18:in `instruct_land'
[7] pry(main)> airport
=> #<Airport:0x00007fb3f7be4878
 @max_capacity=20,
 @planes=[#<Plane:0x00007fb3f82905c8>],
 @weather=["stormy", "sunny", "sunny", "sunny", "sunny", "sunny"]>
[8] pry(main)> 

# The program

- The above is a snippet of the main features for this airport program    being run in pry
- There are two classes; Airport and Plane
- the airport class is initialized with an empty array to store the       planes with a maximum capacity of 20 and an array of mostly sunny       weather instances ("mostly" meaning 5 vs 1 instance of stormy)
- the .sample method is called on the array when taking off and landing   to simulate the weather
- Planes cannot land once landed, and also cannot take-off from an        airport they are not currently in
- 

# Tests

- test coverage includes multiple planes taking off and landing at once
- tests also include method stubs to fix the weather and make sure the    test behaviour is consistent