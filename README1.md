Airport Challenge
=================

The purpose of this project is to create a model of an airport using a test driven approach. By reading the user stories, planes needed to take off from an airport and to land at an airport. Planes cannot land if the airport is full and cannot take of from an airport they are not in. Furthermore, planes cannot land or take off in stormy conditions.

# Tools used

- Ruby
- Rspec

# Domain Models

# Classes

- Airport
- Plane

# Modules

- Weather

*NB. I decided to use weather as a module for the airport challenge. My logic was that we only needed to cal weather once, although later on in week 2 I realised I'd been using modules completely worn.*

# How to use

The majority of the methods are called on an instance of the plane class. A plane is asked to land at an airport. A plane is asked to take off from an airport. The plane knows whether the conditions are safe to take off or land with help from the weather module. AN example of how to use the code is shown below.

```
USERs-MacBook-Air-3:airport_challenge Mike$ irb
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fac2d012148 @planes=[], @capacity=10>
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fac2d002540 @status="flying">
2.2.3 :004 > plane.land(airport)
 => "landed"
2.2.3 :005 > plane.land(airport)
RuntimeError: The plane has already landed
	from /Users/Mike/Google Drive/Projects/Weekend_Challenges/airport_challenge_2/airport_challenge/lib/plane.rb:38:in `plane_landed?'
	from /Users/Mike/Google Drive/Projects/Weekend_Challenges/airport_challenge_2/airport_challenge/lib/plane.rb:12:in `land'
	from (irb):5
	from /Users/Mike/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :006 > plane.take_off(airport)
 => "flying"
2.2.3 :007 > plane.take_off(airport)
RuntimeError: The plane is currently flying
	from /Users/Mike/Google Drive/Projects/Weekend_Challenges/airport_challenge_2/airport_challenge/lib/plane.rb:34:in `flying?'
	from /Users/Mike/Google Drive/Projects/Weekend_Challenges/airport_challenge_2/airport_challenge/lib/plane.rb:20:in `take_off'
	from (irb):7
	from /Users/Mike/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :008 >
```

# Issues faced

I spent a long time deliberating about whether a plane would land at an airport, or if an airport would land a plane.

# Future intentions

# Collaborations
