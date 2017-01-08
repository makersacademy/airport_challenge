#README#
[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)

##How I worked##
I aimed to complete this challenge in a test driven manner, using manual feature tests within IRB and automated unit tests with rspec. I broke each user story down using a domain model (and a corresponding functional representation). Thereafter, I converted each individual user story into a failing manual feature test and then translated this into rspec as a new failing unit test. Code was then written thereafter. I have aimed to commit every test cycle so you can so my process.

I have tried to encapsulate my code as much as possible throughout and the end user should only ever be interacting with an instance of the Airport class, although the user (traffic controller) can also interact directly with the plane (beneficial for emergency landings for example).

eg to land a plane, the end user would call land on the airport they are at, passing the plane they want to land as an argument airport.land(plane) and vice-versa for taking-off airport.take_off(plane). They could also instruct the plan to land at a specific airport i.e. plane.land(airport). No one can interact with a weather instance.

##Installation Instructions##
Clone the repository from [github](https://github.com/mbgimot/airport_challenge) and then move to the repository.

```
$ git clone git@github.com:mbgimot/airport_challenge.git
$ cd airport_challenge
```

Load dependencies with bundle
```
$ gem install bundle
$ bundle install
```

Load the app in IRB
```
irb
2.2.3 :001 > load './lib/airport.rb'
```

##Sample Code###
```
2.2.3 :002 > heathrow = Airport.new
 => #<Airport:0x007fad30897c38 @planes=[], @capacity=20>
2.2.3 :003 > XFJ3201 = Plane.new
 => #<Plane:0x007fad3088d7b0 @flying=false>
2.2.3 :004 > XFJ3201.land(heathrow)
RuntimeError: Cannot land plane when stormy
2.2.3 :005 > XFJ3201.land(heathrow)
 => #<Airport:0x007fad30897c38 @planes=[#<Plane:0x007fad3088d7b0 @flying=false>], @capacity=20>
2.2.3 :006 > XFJ3201.take_off(heathrow)
 => #<Plane:0x007fad3088d7b0 @flying=true>
 ```

 N.B. Weather is random and the plane cannot land nor take off when weather is stormy

##Functional Representation##
Objects | Messages
------- | --------
Air traffic controller |
Airport | land
Plane | land
Plane | flying?
Airport | take_off
Plane | take_off
Stormy Weather | prevent_take_off
Stormy Weather | prevent_landing
Airport | full?
Airport | default_capacity


##Diagram##
Plane <-- flying? -- > true/false  
Airport or Plane<-- land --> lands plane
Airport or Plane<-- take_off --> plane departs
Stormy Weather <-- prevent_take_off --> prevents plane taking off
Stormy Weather <-- prevent_landing --> prevents plane landing
Airport <-- full? --> prevents plane landing
Airport <-- default_capacity --> default capacity of planes of an airport

##Contributors##
Mitchell Goldbay [github](https://github.com/mbgimot/) [mitchellgoldbay@gmail.com](mailto: mitchellgoldbay@gmail.com)
