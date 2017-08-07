#Airport Challenge#

Software to control the flow of planes at an airport. The planes can land and take off provided that the weather is not stormy, and the airport is not full.

Program has 3 classes Plane, Airport and Weather stored in separate files within Lib:
./Lib/Plane.rb etc.

Rspec has 3

##How it works##
###An instance of Airport class (airport) instructs an instance of Plane class (plane) to land.###
Program fails if plane has landed, weather is stormy or airport is full.

- Landed is checked via calling method to read plane's landed instance variable.

- Weather is randomly determined whenever the land method is called via the stormy? method that is called on the instance of Weather class stored in the airport.

- Full is determined by checking size of airport's planes array against airport's capacity

When plane lands, landed is set to true and plane is added to airport's planes array.

###airport instructs plane to take-off###
Program fails if plane is not present in airport's planes array or weather is stormy.



:004 > airport = Airport.new
 => #<Airport:0x007f9623207130 @planes=[], @capacity=2, @weather=#<Weather:0x007f96232070e0>>
:005 > plane = Plane.new
 => #<Plane:0x007f96231ff598>
:006 > plane = Plane.new
 => #<Plane:0x007f96231f72d0>
:007 > p airport.here? plane
false
 => false
:008 >
:009 >   airport.land plane
 => true
:010 > p airport.here? plane
true
 => true
:011 > p airport.take_off plane
<Plane:0x007f96231f72d0 @landed=false>
 => #<Plane:0x007f96231f72d0 @landed=false>
:012 > p airport.here? plane
false
 => false
