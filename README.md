Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------` `` `
                =  ===(_________)

```

- [Task](#task)
  * [User Stories](#user-stories)
    + [Edge cases](#edge-cases)
  * [Domain Model](#domain-model)
  * [Instructions](#instructions)
    + [Before you start](#before-you-start)
    + [Running in IRB](#running-in-irb)
    + [Testing in Rspec](#testing-in-rspec)
  * [Test results](#test-results)

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

### User Stories
Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

#### Edge cases

```
Ensuring that planes can only take off from airports they are in

Planes that are already flying cannot takes off and/or be in an airport

Planes that are landed cannot land again and must be in an airport
```

### Domain Model

| Objects        | Methods           
| ------------- |:-------------:|
|Air Traffic Control||
|Airport|land(plane),takeoff(plane),full?|
|Plane|status?|
|Weather|stormy?|

I made a decision not to have a separate class for weather and just to call it when needed.  The weather could change at any time so didn't feel it needed to be created up front.  I did separate weather into a module though as still felt I wanted to keep it separate.

Some additional steps that I might extend this with is to add in an overarching airport network object that can double check that there are no planes landed in the middle of nowhere or planes that are flying but are also booked into an airport.  This shouldn't happen using the recommended steps of creating airports and planes and asking them to land and take off but could be useful to if things get more complex.

### Instructions

#### Before you start

* Requires Ruby 2.5.0
```
rvm install "ruby-2.5.0"
```
* Install the Bundle Gemfile
```
bundle install
```

#### Running in IRB

```
require './lib/airport.rb'
require './lib/plane.rb'
```

To create an airport:
```
airport = Airport.new
```
You can override the default capacity of the airport hangar by adding an argument (integers only) ` airport = Airport.new(20) `

To create a plane:
* plane that starts in the airport hangar
```
plane = Plane.new(airport)
```
* plane that starts in the air
```
plane = Plane.new
```
Multiple planes can be added to an airport hangar e.g. ` plane2 = Plane.new(airport) = `

Command a plane to land or takeoff
```
airport.land(plane)
airport.takeoff(plane)
```

When the weather is stormy (randomly generated approx. 20% of the time) landing and takeoff is prohibited.

For testing purposes it is possible to override this by using the following:
`
airport.update_weather("sunny")
` OR `
airport.update_weather("stormy")
`

Planes will also be stopped from landing at an airport that is already full

There are also checks for the following:
* to ensure that you are not trying to instruct a plane to take off from an airport that it isn't currently at
*  that you can't ask a plan to land if it's already landed
* that you can't ask a plane to take off if it's already in the air

#### Testing in Rspec

Run
`
rspec
`
in terminal

### Test results

```
100% COVERAGE
```

```
0 Offenses in Rubocop
```
