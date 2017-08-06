Airport Challenge Beta (FreddieCodes)
=====================================

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

Instructions
---------
Program requires Ruby.
You can run this program in irb.

```
$  irb
>> require "./lib/airport.rb"
=> true
>> require "./lib/plane.rb"
=> true
>> require "./lib/weather.rb"
=> true
>> airport = Airport.new
=> #<Airport:0x007fc2da84d358 @planes=[], @capacity=10, @weather=#<Weather:0x007fc2da84d330>>
>> plane = Plane.new
=> #<Plane:0x007fc2da8467d8>

```
To start the program `require "./lib/airport.rb"`, `"./lib/weather.rb"` and `"./lib/plane.rb"` as shown above.

* To create an airport `airport = Airport.new` (default capacity of 10 planes)
* To create an airport `airport = Airport.new` (default capacity of 10 planes)
* To create a plane `plane = Plane.new`
* To land a plane `airport.land(plane)`
* To tell a plane to depart `airport.depart(plane)`

Airports cannot land or takeoff during stormy weather. The weather at an airport is determined using a random number generator (found in weather.rb).

Planes cannot depart from a different airport to the one it landed at.

Description
-----
Below are user stories I used to design this software:

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

Although the code implements all of the user stories it is still in beta.

Scheduled updates:
* added functionality to planes e.g. automated names, landed
* refactoring raises into two methods

The final release will be arriving in the near future.

Files
---------
`airport.rb`
`plane.rb`
`weather.rb`

The Journey
---------
* TDD - using feature tests and unit tests to guide implementation
* Building classes and methods that fulfill the user story
* Using stubs and allows to isolate unit tests (using rspec)
* Writing code in compliance with rubocop
* Refactoring
* Testing for edge cases
