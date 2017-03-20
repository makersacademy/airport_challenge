Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Week 1 Weekend Challenge for Makers Academy. This is a programme which controls the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

How it works
---------
The programme allows the user to create instances of airports and planes.

Airports are created with an empty landing strip of default capacity for 100 planes, which may be overriden at initialization by passing in an optional argument. Airports can keep track of planes that have landed in them.  

Planes are created with a 'airborne' status. Planes can land at and take off from airports. Planes can also confirm landing and take off by reporting their status as being 'airborne' or 'landed'. Taking off will fail if the plane is not in the airport, and landing will fail if the plane is not airborne. If the airport is at full capacity, the plane will not be able to land. 

Planes may land or take off in sunny weather, but are prohibited from doing so if it is stormy. The weather is simulated with a random 'weather forecast' generator, where there is 25% chance of stormy weather. 

How to run it
-------
##### To create a new airport and plane:
```
Viviens-MacBook-Pro:airport_challenge vivientang$ pry
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> require './lib/plane'
=> true
[3] pry(main)> require './lib/weather'
=> false
[4] pry(main)> airport = Airport.new
=> #<Airport:0x007fde8d99a3b8
 @capacity=100,
 @landing_strip=[],
 @weather=#<Weather:0x007fde8d99a368>>
[5] pry(main)> plane = Plane.new
=> #<Plane:0x007fde8d45aee8 @status=:landed>
```
##### To land a plane and confirm the landing:
```
[7] pry(main)> airport.land(plane)
=> [#<Plane:0x007fdafb956ba8 @status=:airborne>]
[8] pry(main)> plane.report_landing
=> :landed
```
##### To take off a plane and confirm its take-off:
```
[10] pry(main)> airport.take_off(plane)
=> #<Plane:0x007fdafb956ba8 @status=:landed>
[11] pry(main)> plane.report_take_off
=> :airborne
[12] pry(main)>
```
##### Planes cannot land or take off in stormy weather:
```
[9] pry(main)> airport.take_off(plane)
RuntimeError: The weather is too stormy for take off
from /Users/vivientang/Dropbox/makersProjects/airport_challenge/lib/airport.rb:24:in `take_off'
```
##### To override the default capacity for a new airport:
```
[12] pry(main)> Heathrow = Airport.new(200)
=> #<Airport:0x007fdafb883438
 @capacity=200,
 @landing_strip=[],
 @weather=#<Weather:0x007fdafb8832f8>>
 ```
Approach to solving the challenge
-----
A TDD approach was used to solve this challenge, by running feature tests in pry and unit tests in Rspec. 
The review.md file was used to help refactor my code.

1. Created an Airport class which could land, store, and take off planes.
2. Created a Plane class which could land and take off from airports.
3. Gave instances of Airport a default capacity, which could be overridden.
4. Raised errors for edge cases. 
5. Created a Weather class to generate stormy conditions 25% of the time.
6. Included Weather class in Airport, to raise errors when conditions are stormy.
7. Refactored. 

Bonus
-----
Write an RSpec feature test that lands and takes off a number of planes:
```
[12] pry(main)> airport.landing_strip
=> [#<Plane:0x007fa16f322b80 @status=:airborne>,
 #<Plane:0x007fa16f2eb338 @status=:airborne>]
[13] pry(main)> airport.take_off(plane1, plane2)
ArgumentError: wrong number of arguments (2 for 1)
from /Users/vivientang/Dropbox/makersProjects/airport_challenge/lib/airport.rb:21:in `take_off'
```
Could write a unit test:
```
#from './lib/airport_spec.rb

describe Airport do

    subject(:airport) { described_class.new }
    let(:plane) { double :plane }
    
    describe '#land' do
        it 'allows multiple planes to land at the same time' do
        expect(airport.land(plane, :another_plane)).to eq [[plane, :another_plane]]
      end
     end
```
And then add a splat argument into the #land and #take_off methods to accept multiple planes if desired.
