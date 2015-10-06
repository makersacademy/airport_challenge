Airport Control System		![](https://travis-ci.org/UsmanJ/airport_challenge.svg?branch=master)	[![Coverage Status](https://coveralls.io/repos/makersacademy/airport_challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/makersacademy/airport_challenge?branch=master)
======================

Synopsis
-----

The task set was to build an air traffic controller. The purpose of this controller is to let the planes know whether to land /take off or not. Some conditions had to be met such as:

- Plane can not land when the weather is stormy
- Plane can not land when the airport is full
- Plane can not take off when weather is stormy

Other conditions exist but they are more common sense i.e. plane can't land if it has already landed.
The maximum capacity of this airport was set to 80 planes. 


Approach towards solving the challenge
--------------------------------------

This challenge was solved by firstly deciding on how many classes were needed. Two classes and one module was used in this project as it felt like the best option.

RSpec tests were written first followed by the code to make them pass. As the project developed; some tests had to be altered or deleted altogether to compliment the progress of the project.

The airport control system is fully functional; however if you feel that their are any errors please let me know.


Steps of using the control system
---------------------------------
```
irb(main):008:0> airport = Airport.new
=> #<Airport:0x007f90042ecd68 @planes=[], @capacity=80>
irb(main):009:0> plane = Plane.new :Paris
=> #<Plane:0x007f90042f4cc0 @flying=true, @destination=:Paris>
irb(main):010:0> airport.land plane
=> [#<Plane:0x007f90042f4cc0 @flying=true, @destination=:Paris>]
irb(main):011:0> plane
=> #<Plane:0x007f90042f4cc0 @flying=true, @destination=:Paris>
irb(main):012:0> plane.landed?
=> false
irb(main):013:0> plane.land
=> true
irb(main):014:0> plane.landed?
=> true
irb(main):015:0> airport.take_off
RuntimeError: Stormy weather
	from /Users/UsmaanJ/Desktop/Projects/airport_challenge/lib/airport.rb:24:in `take_off'
	from (irb):15
	from /Users/UsmaanJ/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
irb(main):016:0> airport.take_off
=> #<Plane:0x007f90042f4cc0 @flying=false, @destination=:Paris>
irb(main):017:0> plane.take_off
=> true
irb(main):018:0> plane.flying?
=> true
```
