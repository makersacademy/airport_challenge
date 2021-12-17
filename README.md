# Airport Challenge

Implementation of an airport software that manages planes landing and taking-off process at an airport.

## Getting started

Clone the repository to your local maschine and install GEMs with bundle from top level folder:

`git clone https://github.com/michael-zwickler/airport_challenge`

`bundle`

## Usage

Run in terminal or IRB (see some examples below). Software will throw several error messages, e.g. when plane obj. is flying already and is asked to take-off or if weather is too stormy at airport.

`airport = Airport.new(20)` 
- Creates a new Airport with a capacity of 20 docks. Default value is 50 if no parameter given. 

`plane = Plane.new()` 
- Creates a new plane. The plane will be flying at creation

`airport.call_to_land(plane)` 
- Asks the plane to land in the airport. Requires plane object as argument.

`airport.call_to_take_off(plane)` 
- Asks the plane to take-off from airport. Requires plane object as argument.

## Running tests

Running RSpec in Terminal:

`rspec`