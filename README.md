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

Description
===========
This is the Week 1 weekend challenge from Makers Academy. The challenge was to design an airport to the following specification:

* Multiple airports can be created
* Multiple planes can be created
* Airports have a default capacity for planes, but can be created with a custom capacity
* Airports can allow planes to land and take off
* Planes cannot land at an airport which is at capacity
* Planes can only take off from airports at which they have landed
* Planes cannot land if they are already on the ground
* Planes cannot take off if they are already flying
* Airports do not allow planes to land or take off when the weather is stormy
EXTRA * You can check whether a specific plane has landed at a given airport

My project consists of an Airport class, Plane class, and a Weather module which is included in the Airport class.

Technologies
============
* Code is written in Ruby
* Testing done using RSpec
* Coveralls used to assess test coverage
* Travis CI used to check build status (badge displayed below)

How to Install
==============
1. Fork this repo
2. Clone your forked repo to your local machine
3. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle` to install the gems needed to run the program

How to Use
==========
1. Open a terminal and run `irb` or `pry` (I prefer to use Pry)
2. Require `./lib/airport`
3. Create an airport and some planes

```
 🐢  ᛬ require './lib/airport'
=> true
 🐢  ᛬ airport_1 = Airport.new
=> #<Airport:0x007fb8ab2ba348 @capacity=2, @planes=[]>
 🐢  ᛬ airport_2 = Airport.new
=> #<Airport:0x007fb8ab25b028 @capacity=2, @planes=[]>
 🐢  ᛬ plane_1 = Plane.new
=> #<Plane:0x007fb8ab211c48 @flying=true>
 🐢  ᛬ plane_2 = Plane.new
=> #<Plane:0x007fb8ab168300 @flying=true>
```

4. Land a plane (may encounter stormy weather)

```
 🐢  ᛬ airport_1.land(plane_1)
RuntimeError: #<Plane:0x007fb8ab211c48> cannot land due to stormy weather.
 🐢  ᛬ airport_1.land(plane_1)
=> "#<Plane:0x007fb8ab211c48> has landed."
 🐢  ᛬ airport_2.land(plane_2)
=> "#<Plane:0x007fb8ab168300> has landed."
```

5. Try taking off a plane from a different airport!

```
 🐢  ᛬ airport_1.take_off(plane_2)
RuntimeError: #<Plane:0x007fb8ab168300> does not exist at this airport.
```

6. Check whether a plane is at the airport

```
 🐢  ᛬ airport_1.confirm_location(plane_1)
=> "#<Plane:0x007fb8ab211c48> is at this airport."
 🐢  ᛬ airport_1.confirm_location(plane_2)
=> "#<Plane:0x007fb8ab168300> has not landed at this airport."
```

7. Take off a plane from the correct airport

```
 🐢  ᛬ airport_1.take_off(plane_1)
=> "#<Plane:0x007fb8ab211c48> has left the airport."
 🐢  ᛬ airport_2.take_off(plane_2)
=> "#<Plane:0x007fb8ab168300> has left the airport."
```

Optional: If you wish to run the tests for this project, enter `rspec` into your command line. If you wish to view the test coverage, enter `coveralls report` into your command line.

History
=======
* Project was forked from Makers Academy as part of a weekend challenge. The challenge was to create a program to the specification noted above (see: Description). I have tried to adhere to the single responsibility principle. I have also used private methods where applicable in my airport class. The only methods that are public are the ones which the user should interact with.
* In order to account for random weather generation in my tests, I have used `srand` to manipulate the desired outcome of `rand` in my weather module.
* My approach to solving this challenge involved using TDD. Further details of the creation process can be found in the commit descriptions on my [GitHub repository](https://github.com/kwilson541/airport_challenge/commits/master)
* Weather was initially included as a private method within airport, and later seperated to be a module so that it could be included in any later programs that would require a weather module.

Travis CI status badge [![Build Status](https://travis-ci.org/kwilson541/airport_challenge.svg?branch=master)](https://travis-ci.org/kwilson541/airport_challenge)