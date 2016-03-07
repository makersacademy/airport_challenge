Airport Challenge
=================

Functionality
-------------

1. Planes can land
2. Planes can take off
3. Can show the location of a plane
4. Can confirm plane has landed or left airport
5. No planes can land or take during stormy weather (randomised)
6. Planes cannot land if already landed
7. Planes cannot land if airport is full
8. airport has changeable capacity
9. Planes cannot leave if not at airport

Installation
------------

Fork and clone from

https://github.com/hanfak/airport_challenge

Run tests from parent folder ```rspec```

Run feature tests, open ```feature_spec``` and  manually enter in Pry.

Example of running program


[2] pry(main)> require './lib/airport.rb'
=> true

[3] pry(main)> require './lib/plane.rb'
=> true

[4] pry(main)> heathrow = Airport.new
=> #<Airport:0x007fc33932e2f0 @capacity=20, @planes_in_airport=[]>

[5] pry(main)> plane = Plane.new
=> #<Plane:0x007fc3392ec6e8 @in_airport=false>

[6] pry(main)> plane.at_airport?
=> false

[7] pry(main)> heathrow.land(plane)
=> [#<Plane:0x007fc3392ec6e8 @in_airport=true>]

[8] pry(main)> plane.at_airport?
=> true


Documentation
-------------
Language used: Ruby 2.2.3

Unit testing framework: Rspec 3.4.2

Feature testing: Manually using pry

Author
------
Hanif Fakira

Contact
-------
fakira.work@gmail.com

https://github.com/hanfak
