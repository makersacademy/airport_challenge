# Airport Challenge

This program controls the landing and takeoff of planes at an airport.

## Motivations for this project

* Week 1 Makers Academy weekend challenge
* Demonstrate knowledge of Ruby
* Practise TDD
* Practise OOD
* Write code that is ready for review

## Features

* Can instruct a plane to land & takeoff
* A plane cannot land if airport is full
* A plane cannot takeoff if airport is empty
* A plane cannot land/takeoff if the weather is stormy
* The weather is assigned randomly with a set probability of stormy weather
* Covered edge cases: 1) cannot land a plane which is already landed 2) cannot takeoff a plane which is not at the airport


## Getting started

1. clone rep to your local machine `git clone path-to-your-repo`
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, `run bundle`

## Usage

App runs in the command line.
Run irb in terminal and `require './lib/airport.rb'`

## Running tests

Run tests using:
`rspec`
