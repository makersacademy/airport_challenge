
# README                                
[![BuildStatus](https://travis-ci.org/TomStuart92/airport_challenge.svg?branch=master)](https://travis-ci.org/TomStuart92/airport_challenge)

Taken together these files constitute a fully tested airport model.

## Install Instruction

To install these files from Github:
1. Fork this repo, and clone to your local machine.
2. Run the command gem install bundle (if you don't have bundle already) from the cloned file location.
3. When the installation completes, run bundle.
4. Run IRB -r './lib/airport.rb'
5. Rspec tests can be found at Rspec spec

## Approach to Solution

My approach to this project was heavily influenced from the Boris Bikes Project. (https://github.com/TomStuart92/boris-bikes).

Plane objects are only responsible for tracking their own internal flying/landed state.
The Weather class is responsible for providing a randomly generated boolean representing whether the weather is safe to fly in.
The Airport class is responsible for landing and taking off objects.

I have focused on ensuring minimal dependencies between my classes.
This was done using dependency injection, and limiting the number of public methods.

This blog post explores this further: (https://tomstuart92.github.io/Airports/)

## Usage Instructions
To create a new Plane `plane = Plane.new`
To create a new airport `airport = Airport.new`
(Creates Airport using Default Weather Class)

Then planes can be landed and take off:
`airport.land(plane)`
`airport.takeoff(plane)`

Land and takeoff are contingent on good weather, and the plane being in the correct state.
For example a plane cannot land if it has already landed at another airport.

In IRB:

```
tomstuamacbook2:airport_challenge Tom$ irb -r './lib/airport.rb'
2.2.4 :001 > airport=Airport.new
 => #<Airport:0x007fa00393aad0 @capacity=6, @weather=#<Weather:0x007fa00393aa80 @unsafe_prop=2>, @landed_planes=[]>
2.2.4 :002 > plane=Plane.new
 => #<Plane:0x007fa00403cf40 @landed=false>
2.2.4 :003 > airport.land(plane)
RuntimeError: Poor weather means the plane has to divert.
	from /Users/Tom/Programming/MakersAcademy/WeekOne/Airport/airport_challenge/lib/airport.rb:34:in `pre_landing_checks'
	from /Users/Tom/Programming/MakersAcademy/WeekOne/Airport/airport_challenge/lib/airport.rb:14:in `land'
	from (irb):4
	from /Users/Tom/.rvm/rubies/ruby-2.2.4/bin/irb:11:in `<main>'
2.2.4 :004 > airport.land(plane)
The plane has landed safely at the airport.
 => nil
2.2.4 :005 > airport.land(plane)
RuntimeError: That plane is at another airport.
	from /Users/Tom/Programming/MakersAcademy/WeekOne/Airport/airport_challenge/lib/airport.rb:32:in `pre_landing_checks'
	from /Users/Tom/Programming/MakersAcademy/WeekOne/Airport/airport_challenge/lib/airport.rb:14:in `land'
	from (irb):6
	from /Users/Tom/.rvm/rubies/ruby-2.2.4/bin/irb:11:in `<main>'
2.2.4 :006 > airport.takeoff(plane)
The plane has successfully taken off.
 => nil
 ```

### Author Details
Created by Tom Stuart
www.github.com/tomstuart92
