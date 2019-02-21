# Airport Challenge

Makers Week 1 (Friday) - This project is an application to control the landing and takeoff of planes from an airport.

## Getting started

Assuming you have 'git' installed, in the location of your choice, in Terminal:

`git clone git@github.com:alittlecross/airport-challenge.git`

`cd` into the `airport-challenge` folder.

Assuming you have `Ruby` and `Bundler` installed, in that same location, in Terminal:

`bundle`

## Usage

In that same location, in Terminal:

`irb -r ./lib/airport.rb`

To create a new airport:

`idlewild = Airport.new`

Airports are created with a default capacity of 10, this can be overridden on instantiation using an integer as an argument:

`idlewild = Airport.new(20)`

To create a new plane:

`enola_gay = Plane.new`

To land a plane at an airport:

`idlewild.land(enola_gay)`

To takeoff a plane from an airport:

`idlewild.takeoff(enola_gay)`

Weather is generated randomly and will be stormy 25% of the time, meaning planes cannot land or take off.

This can be overridden in an emergency or to check behaviour; use `true` (stormy) or `false` (clear) as an additional argument in the `.land` and `.takeoff` methods:

`idlewild.land(enola_gay, true)`

## Running tests

In that same location, in Terminal:

`rspec`

## Linting

In that same location, in Terminal:

`rubocop`
