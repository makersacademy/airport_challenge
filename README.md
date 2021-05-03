## Project title
* Airport Challenge

## Motivation

Client request for a program that can perform the following functions.
* Instruct a plane to land at the airport
* Take off from the airport and confirm it has left.
* Prevent a plane from landing when the airport is full.
* Defauly airport capacity that can be overidden.
* Prevent a plane from taking off or landing during stormy weather. 
* Planes that have already landed cannot land again.

## Build status
* Initial files being created
* Completed 5 / 6 stories (Day1)
* Completed all user stories (Day2)
* Refracted the code from Plane.new to double(:plane) to isolate tests.
* Added a bonus test to land and take off multiple planes.

## Code style
* Test-driven development
* Pair programming (Navigator/Driver)

## Tech/framework used
* VS Code (Live Share)
* GitHub
* Rspec
* Bundler
* Zoom

## Built with
* Ruby

## Installation
* Install rspec
* Install bundler
* Run bundler
* Test in irb
* Run rspec

## Tests
* Initially ran the test in irb as I thought the program should run. I fixed the initial errors.
* Ran tests to respond to the 2 classes.
* Ran tests on methods.

## How to use?
* You can create an airport - airport = Airport.new (the default capacity will be 20 if no argument is given when instatiating a new airport).
* You can create a plane - plane = Plane.new
* Land a plane - airport.land(plane), this will not work if the weather is stormy or the airport is full.
* Plane to takeoff - airport.takeoff(plane), this will not work if the weather is stormy.

## Credits
* Dewald Viljoen
* JP Ferreira


