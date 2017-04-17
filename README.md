[![Coverage Status](https://coveralls.io/repos/github/makersacademy/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/makersacademy/airport_challenge?branch=master)
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

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

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

# Structure
The program uses three classes to achieve the specification: `Airport`, `Plane` and `WeatherGenerator`. Users can create an `Airport` with a custom capacity (default 5) and storm probability (default 10) by passing these values as arguments to the initialiser. The `Airport` is responsible for requesting that a plane lands or takes-off with responsibility for taking the action delegated to the `Plane` class. The `WeatherGenerator`'s `generate_random_weather` method can be passed a probability (0-100) and returns `0` for stormy and `1` for not stormy. This method is called by the `Airport` class to determine the current weather conditions.

# Usage

### Installation
- Clone the repo
- cd to the project folder
- Run `bundle` to install dependencies

### Testing
- Run `rspec`

### Running
- Run `pry`
- Run the following commands

```
[1] pry(main)> require './lib/airport.rb'
=> true
[2] pry(main)> require './lib/plane.rb'
=> true
[3] pry(main)> require './lib/weather_generator.rb'
=> false
[4] pry(main)> miami_international = Airport.new(20, 10)
=> #<Airport:0x007f8dff9a7650 @capacity=20, @planes=[], @storm_probability=10>
[5] pry(main)> london_international = Airport.new(20, 100)
=> #<Airport:0x007f8dffcdf660 @capacity=20, @planes=[], @storm_probability=100>
[6] pry(main)> plane1 = Plane.new()
=> #<Plane:0x007f8dffcf6158>
[7] pry(main)> plane2 = Plane.new()
=> #<Plane:0x007f8e00230c68>
[8] pry(main)> plane3 = Plane.new()
=> #<Plane:0x007f8e0025a158>
[9] pry(main)> plane4 = Plane.new()
=> #<Plane:0x007f8e018e7e20>
[10] pry(main)> plane5 = Plane.new()
=> #<Plane:0x007f8dffc2ebd0>
[11] pry(main)> miami_international.land_plane(plane1)
=> #<Plane:0x007f8dffcf6158
@airport=
#<Airport:0x007f8dff9a7650
@capacity=20,
@planes=[#<Plane:0x007f8dffcf6158 ...>],
@storm_probability=10,
@weather_generator=#<WeatherGenerator:0x007f8dffd343e0>>>
[12] pry(main)> miami_international.land_plane(plane2)
=> #<Plane:0x007f8e00230c68
@airport=
#<Airport:0x007f8dff9a7650
@capacity=20,
@planes=[#<Plane:0x007f8dffcf6158 @airport=#<Airport:0x007f8dff9a7650 ...>>, #<Plane:0x007f8e00230c68...>],
@storm_probability=10,
@weather_generator=#<WeatherGenerator:0x007f8e002bb8e0>>>
[13] pry(main)> miami_international.permit_takeoff(plane2)
=> #<Plane:0x007f8e00230c68 @airport=nil>
[14] pry(main)> london_international.land_plane(plane2);
RuntimeError: The weather at the airport is stormy, you cannot land.
from /Users/projects/weekend_projects/airport_challenge/lib/airport.rb:17:in `land_plane'
```
