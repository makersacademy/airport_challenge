Airport Challenge
=================

[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)

Instructions
------------
1. Fork repo using `git clone <url>`
2. In the relevant folder run `gem install bundle` and then `bundle`
3. In irb, you can use the program in the following way:

```ruby
require './lib/airport'
JFK = Airport.new  # => #<Airport:0x007ffef4072100 @weather="sunny", @planes=[], @capacity=50>
my_plane = Plane.new # => #<Plane:0x007ffef4063010 @flying_status=true>
JFK.plane_land(my_plane) # => [#<Plane:0x007ffef4063010 @flying_status=false>]
JFK.in_this_airport?(my_plane) # => true
JFK.plane_take_off(my_plane) # => #<Plane:0x007ffef4063010 @flying_status=true>

```

Notes
-----
* There is an Airport class, which features an array that planes can take off from and land in.
* An airport has a default capacity of 50 planes; the capacity can be changed by the user via an optional argument when calling `Airport.new`
* There is a Plane class; `Plane.new` defaults to 'flying' (`flying_status: true`).
* The weather is handled via a separate Weather module; this works similarly to a die, and introduces a 1 in 6 chance of stormy conditions. Airports will not allow planes to take off or land in stormy weather.
* You cannot land a plane that is already in an airport, because its flying_status will be false; it will need to take off first.
