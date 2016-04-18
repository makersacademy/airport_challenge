Airport Challenge
=================

This program simulates an air traffic control system, allowing airports to coordinate plane takeoffs and landings.

To run this program, use:

```
git clone https://github.com/kylebuttner/airport_challenge.git
cd airport_challenge
gem install bundle      #if bundle is not already installed
bundle
irb

2.2.3 :001 > require './lib/airport.rb'
 => true
2.2.3 :002 > require './lib/plane.rb'
 => true
2.2.3 :003 > require './lib/weather.rb'
 => true
```

Some sample features:

```
2.2.3 :004 > airport = Airport.new
 => #<Airport:0x007fa5eb936208 @planes=[], @capacity=20>
2.2.3 :005 > plane = Plane.new
 => #<Plane:0x007fa5eb1046c0 @landed=false>
2.2.3 :006 > airport.accept(plane)
 => [#<Plane:0x007fa5eb1046c0 @landed=true>]
2.2.3 :007 > airport.present? plane
 => true
2.2.3 :008 > airport.depart plane
 => #<Plane:0x007fa5eb1046c0 @landed=false>
2.2.3 :009 > airport.present? plane
 => false
2.2.3 :010 > airport.accept(plane) #sometimes planes cannot land due to bad weather
RuntimeError: This plane cannot depart due to adverse weather conditions
2.2.3 :006 > airport.accept(plane)
=> [#<Plane:0x007fa5eb1046c0 @landed=true>]  
2.2.3 :011 > airport.depart(plane) #sometimes planes cannot depart due to bad weather
RuntimeError: This plane cannot depart due to adverse weather conditions
```
