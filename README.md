

Airport Challenge
=================

This project is an application to control the landing and takeoff of planes from an airport

## Getting started

In terminal, in the directory you would like this project:

`git clone git@github.com:alittlecross/airport_challenge.git`

## Usage

In terminal, in the directory for this project:

`irb`

`require './lib/airport.rb'`

Methods that can be called:

* `Airport.new` creates a new airport.

e.g. `idlewild = Airport.new`

* `Plane.new` creates a new plane.

e.g. `enola_gay = Plane.new`

* `.land(plane)` allows a plane to land.

e.g. `idlewild.land(enola_gay)`

* `.takeoff(plane)` allows a plane to take off.

e.g. `idlewild.takeoff(enola_gay)`

* `.change_capacity` changes the airport's capacity.

e.g. `idlewild.change_capacity(8)`

* `.hangar` will show the planes currently in the airports hangar.

e.g. `idlewild.hangar`

## Running tests

In terminal, in the directory for this project:

`rspec`
