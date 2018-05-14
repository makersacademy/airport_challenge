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
### Overview

A program for managing airports and planes, modelling for weather conditions.

- Planes can land and take off if it is sunny.
- If it is stormy, planes cannot land or take off.

### Features

- Allows the creation of multiple airports and planes.
- Allows planes to land at and take off from airports.
- Allows specific weather limits to be set for take off & landing
- Randomised, probabilistic storms.
- Airports can be checked for number of planes they contain at a given time  
- Airports have maximum capacities (default 20), set at initialisation

### Installation

This program was developed in ruby 2.5.0 & formatted with the assistance of Rubocop

To set up the environment:
` $ gem install bundler
  $ bundle install `

### User Instructions

This program is designed to be used from a REPL.
Run IRB from the command line and require the airport, plane and weather files.  
Check out the code examples below for ways in which the program can be used.  

### Code Examples

Plane travelling between airports:

require './lib/airport'
require './lib/plane'
require './lib/weather'

### Tests

Unit tested with RSpec.  All tests can be run from the project home directory using:

` $ rspec `  

Feature testing was carried out in IRB.  Each feature test is contained in an isolated method.  All of these are in the file: './spec/feature_spec.rb'
