# Airport Challenge

Implementation of an airport software that manages planes landing and taking-off process at an airport.

## Getting started

Clone the repository to your local maschine and install GEMs with bundle from top level folder.

`git clone https://github.com/michael-zwickler/airport_challenge`

`bundle`

## Usage

Run in terminal or IRB. See some examples below:

`airport = Airport.new(20)` 
- Creates a new Airport with a capacity of 20 docks. Default value is 50 if no parameter given.

`plane = Plane.new()` 
- Creates a new plane. The plane will be flying at creation.

## Running tests

Running RSpec in Terminal.

`rspec`