===Airport Challenge===

--- 1. Program Instructions ---

IRB EXAMPLE
------------------------------------------
2.2.3 :001 > require './lib/airport.rb'
 => true

2.2.3 :002 > heathrow = Airport.new
 => #<Airport:0x007f866200b3c0 @planes=[], @weather=#<Weather:0x007f866200b398>
 , @capacity=70>

2.2.3 :003 > luton = Airport.new(20)
 => #<Airport:0x007f8662000628 @planes=[], @weather=#<Weather:0x007f8662000600>
 , @capacity=20>

2.2.3 :004 > plane = Plane.new
 => #<Plane:0x007f86610ab3d0 @landed=false>

2.2.3 :005 > heathrow.land(plane)
 => [#<Plane:0x007f86610ab3d0 @landed=true>]

2.2.3 :006 > heathrow.take_off(plane)
 => #<Plane:0x007f86610ab3d0 @landed=false>

2.2.3 :007 > luton.land(plane)
 => [#<Plane:0x007f86610ab3d0 @landed=true>]

2.2.3 :008 > luton.take_off(plane)
 => #<Plane:0x007f86610ab3d0 @landed=false>
--------------------------------------------

BASIC COMMANDS & INFO

your_airport = Airport.new(capacity)        # creates your new airport with a
                                            # random weather status and lets
                                            # you set capacity (defaults to
                                            # 70 if unanswered)
your_plane = Plane.new                      # creates your new plane
your_airport.land(your_plane)               # lands your plane
your_airport.take_off(your plane)           # takes off your plane

These commands are prevented when the weather is stormy. Landing can also be
prevented when the airport is over its capacity. Airport taffic control may
swear at you if you try.

Random weather conditions are created every time an airport is created. There
is a 20% chance of storms.

--- 2. Progress Log ---

(also visible in my github commits)

1. Started with a planes array to be popped and added to. My tests checked
   whether specific planes I created were in the planes array before/after
   landing/take off.

2. It hadn't yet crossed my mind that I'd need to reflect the state of landed
   planes (i.e taken off or landed) in my plane class.

3. I moved on to creating a weather class, on the basis of SRP, to create
   random weather conditions. I used sample to create a 1/5 chance of rain
   and assigned that to the stormy? method, which all new weather instances
   would be initialized with. I tested for randomness by 'rolling the dice'
   a certain amount times (in a loop) and checking the value I wanted was
   there.

4. I then realised my planes would need a landed state and I need to
   allow the Airport and plane class to interact properly. I also realised I
   shouldn't let the same plane land/take-off twice. Ended here for first day.
   My weather tests (i.e mocking randomness) were also failing due
   to my incorrect Rspec test structure.

5. After reviewing the tests, it was clear I had not structured properly,
   so after careful revision, I isolated each method test from each other and
   segregated the conditions of each test according to what I wanted done.
   Felt much more confident after getting the storm tests passing by allowing
   them to receive certain weather conditions.

6. I found default capacity part fun as we had done this exact same thing with
   the Boris Bikes exercise and I understand the use of constants well.

7. I had to leave the test here, in successful working condition, but I know
   I could have implemented some modules perhaps. Didn't get to that stage of
   Boris Bikes either so didn't have time or know-how to start implementing.
