Airport Challenge
------------------

What is it?
------------
This project is built to simulate an airport. Functionality is as follows:

* planes can land 
* planes can take off
* can see all planes landed
* can see if plane has landed or taken off
* allow no planes to land or take off if weather is stormy
* set an adjustable capacity on airport, once filled no more plans can land (you
  can set capacity by adding after creating the airport 'airport = Airport.new
50' will set capacity to 50. If no capacity is set it will default to 20.



Approach
------------
Based on the user stories I took the air traffic controller to be the person
entering commands into the program, and passengers as being irrelevant to the
fucntionality at this stage.
I went through each user story and created domain models and diagrams showing
interactions between objects with messages.

I ended up with 3 classes. Airport, Plane, Weather. Airport has the most
functionality instigating all landing and taking off of planes. Weather has a
random number generator and there is a 1 in 6 chance of the weather being
stormy.


Documentation
------------
Ruby v2.2.1
Rspec v3.4.2 - for unit tests
Feature tests were run manually from a ruby file in the spec folder


Installation
------------
you can clone the entire repo
git clone 'https://github.com/kevinpmcc/airport_challenge.git'

to run tests
'rspec'
from the parent project folder.

to feature test you can use irb or pry or another REPL tool

kevinmccarthy$ irb

2.2.3 :001 > require './lib/plane.rb'

 => true 
 
2.2.3 :002 > require './lib/airport.rb'

 => true 
 
2.2.3 :003 > require './lib/weather.rb'

 => false 
 
2.2.3 :004 > plane = Plane.new

 => #<Plane:0x007fd80309d908 @landed=false, @taken_off=false> 
 
2.2.3 :005 > airport = Airport.new

 => #<Airport:0x007fd80308e188 @capacity=20, @planes=[],
@weather=#<Weather:0x007fd80308e138 @stormy=false>> 

2.2.3 :006 > airport.land(plane)

 => [#<Plane:0x007fd80309d908 @landed=true, @taken_off=false>] 
 
2.2.3 :007 > airport.take_off(plane)

 => #<Plane:0x007fd80309d908 @landed=false, @taken_off=true> 
2.2.3 :008 > 

from there have a look through the files and enjoy.


Author
------------
Kevin McCarthy

Contacts
------------
kevinpatrickmccarthy@gmail.com
https://github.com/kevinpmcc
