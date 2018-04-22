# Airport Challenge

A request from a client to write the software to control the flow of planes at an airport.


## Getting started

1. Fork this repo
2. Clone to your local machine `git clone git@github.com:CharlyMannion/airport_challenge.git`
3. Run the command gem install bundle (if you don't have bundle already)
4. When the installation completes, run bundle
5. Run the command gem install bundle (if you don't have bundle already)
6. When the installation completes, run bundle


## Running tests

`rspec`


## How I approached the challenge

I followed a TDD approach to this challenge.
My first step was to write a feature tests, and watch them fail. I would then use the feature test to help me write a unit test, and watch it fail. I would read the error messages the unit test generated to help me write the code I wanted.
I ran rubocop regularly to help me improve my code.
I repeated this process to grow the program and meet the requirements in the user stories.
When I had satisfied all the user stories, I began to think about ways my code could be improved e.g. by guarding against edge cases.
When I was happy with the program at a particular point, I attempted to refactor to follow principles such as DRY.
I tried to ensure the principle of single responsibility was followed.
I ensured I had a high test coverage.
I made it my goal to use doubles and mocking in my tests to improve in this area.


## What I would like to do to improve my program

I would like to refactor my code further i.e. use blocks to set up stubbing behaviour that is shared across a number of tests.
I would like to include tests to make sure my program would work for multiple planes.


## irb Transcript sample

Charlys-Air:airport_challenge charlymannion$ irb
2.5.0 :001 > require './docs/airport'
 => true
2.5.0 :002 > airport = Airport.new
 => #<Airport:0x00007fb227902b40 @stationed_planes=[], @capacity=10, @weather=#<Weather:0x00007fb227902b18>>
2.5.0 :003 > plane = Plane.new

 => #<Plane:0x00007fb2278f95e0>
2.5.0 :004 > airport.land(plane)
Traceback (most recent call last):
        3: from /Users/charlymannion/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):4
        1: from /Users/charlymannion/Projects/WeekOne/airport_challenge/docs/airport.rb:17:in `land'
RuntimeError (Weather too stormy to land)
