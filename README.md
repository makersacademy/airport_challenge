# Airport challenge

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

A piece of code for managing airports, the planes they contain, and the weather.

### Motivation

This project has been created as part of my journey as a junior developer at Makers Academy.

### Features

- Allows multiple airports to be created.
- Allows multiple planes to be created.
- Allows planes to be landed and taken off from airports.
- Allows weather limits to be set for taking off and landing.
- Randomised, probabilistic storms.
- Airports can be checked for the planes they contain
- Airports have maximum capacities (default 20), set at initialisation

### Installation

Program developed in ruby 2.5.0

To set up the environment:

```
$ gem install bundler
$ bundle install
```

### How to use?

This program is designed to be used from a REPL, e.g. IRB or PRY. Please run one of these from the command line, and require the airport, plane and weather files. The code examples below show some of the uses.

### Code example

Plane travelling between airports:

```
require './lib/airport'
require './lib/plane'
require './lib/weather'

calm_weather = Weather.new(Weather::STORMY_WIND_SPEED - 1)
houston_airport = Airport.new
gatwick_airport = Airport.new
airbus_a380 = Plane.new

houston_airport.land(airbus_a380, calm_weather)
houston_airport.planes # => [airbus_a380]

houston_airport.take_off(airbus_a380, calm_weather)
houston_airport.planes # => []

gatwick_airport.land(airbus_a380, calm_weather)
gatwick_airport.planes # => [airbus_a380]
```

Operations limited by stormy weather:

```
require './lib/airport'
require './lib/plane'
require './lib/weather'

stormy_weather = Weather.new(Weather::STORMY_WIND_SPEED)
houston_airport = Airport.new
airbus_a380 = Plane.new

houston_airport.land(airbus_a380, stormy_weather) # => It's too stormy!
```

Airport full:

```
require './lib/airport'
require './lib/plane'
require './lib/weather'

houston_airport = Airport.new
calm_weather = Weather.new(Weather::STORMY_WIND_SPEED - 1)

Airport::DEFAULT_CAPACITY.times do
  houston_airport.land(Plane.new, calm_weather)
end

houston_airport.land(Plane.new, calm_weather) # => Airport full.
```

Setting airport capacity:

```
require './lib/airport'

houston_airport = Airport.new(45)
houston_airport.capacity # => 45
```

### Tests

Testing was carried out using RSpec. tests can be run from the project home directory:

```
$ rspec
```

Feature testing was carried out in irb, the file feature_spec.rb in the spec folder contains methods each containing a single feature spec. An example running of a feature spec can be seen below:

```
[williampowell:.../Projects/airport_challenge]$ irb -r './spec/feature_spec.rb'
2.5.0 :001 > takeoff_plane
 => true
2.5.0 :002 > exit
```
