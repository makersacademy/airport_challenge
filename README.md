# Project Title

Airport Challenge - Makers Academy

## Description

The task is to write the software to respond to user stories about the control of planes landing and taking off at an airport.


## irb sample input

Antonias-MBP:airport_challenge attyc$ irb
2.4.0 :001 > require './spec/feature_spec.rb'
 => true
2.4.0 :002 > w = Weather.new
 => #<Weather:0x007f8a750d8a70>
2.4.0 :003 > a = Airport.new
 => #<Airport:0x007f8a750d0c80 @planes=[], @capacity=5>
2.4.0 :004 > p0 = Plane.new
 => #<Plane:0x007f8a750c9188>
2.4.0 :005 > p1 = Plane.new
 => #<Plane:0x007f8a750c12d0>
2.4.0 :006 > p2 = Plane.new
 => #<Plane:0x007f8a750b8a68>
2.4.0 :007 > a.land(p0,w)
 => [#<Plane:0x007f8a750c9188>]
2.4.0 :008 > a.land(p1,w)
RuntimeError: Plane may *not* land
	from /Users/attyc/Documents/workspace/Projects/makers/week1/airport_challenge/lib/airport.rb:30:in `land'
	from (irb):8
	from /Users/attyc/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :009 > a.land(p2,w)
 => [#<Plane:0x007f8a750c9188>, #<Plane:0x007f8a750b8a68>]
2.4.0 :010 > a.planes.count
 => 2
 2.4.0 :011 > a.planes
 => [#<Plane:0x007f8a750c9188>, #<Plane:0x007f8a750b8a68>]


## Running the tests

For testing, require feature_spec.rb

#require './spec/feature_spec.rb'

In this file there are also variables set up to get you going:

w = Weather.new
a = Airport.new
p0 = Plane.new
p1 = Plane.new
p2 = Plane.new
a.land(p0,w)
a.land(p1,w)
a.land(p2,w)
a.planes.count

## Versioning

We use Git and GitHub for versioning. For the versions available, see  (https://github.com/AttyC/airport_challenge).

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to Makers Academy for this challenge
