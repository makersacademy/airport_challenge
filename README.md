## Airport Challenge ###

This project is a test driven, object-oriented program that can be used to control the flow of planes at an airport. It allows planes to take off and land from the given airport provided that the weather conditions are correct.

#### Getting Started ####

Fork and then clone this repo using:
`git clone [path-to-your-repo]`

Install the necessary dependencies using:
`bundle`

#### Usage ####

To start running the program, run:
`irb`

Then require the necessary files:
```
require './lib/airport.rb'
require './lib/plane.rb'
```

Creating a new plane/airport:
```
plane = Plane.new
airport = Airport.new
```

To land a plane:
`plane.land(airport)`

To take-off a plane:
`plane.take_off(airport)`

#### Running Tests ####

To run the tests:
`rspec`
