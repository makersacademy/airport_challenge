# Airport Challenge

Enjoy your dream career as an Air Traffic Controller, only without the stress of actually killing people because of momentary lapses in concentration!

An object-oriented model of airports and planes. Some cool features include:
- Airports of varying sizes!
- Local weather!
- Safe landing and take-offs for planes! (can't send passengers to their death when there's a hurricane)
- Crash landing of planes! (*only if you **really** want to, you monster*)

All tests are passing, with very high test coverage (99%+). It might just be that I'm awful at writing comprehensive unit tests, but I'll let you be the judge of that.

## Installation
1. Clone this repo by running `git clone git@github.com:tbscanlon/airport_challenge.git` from your terminal.
2. Navigate to the project folder: `cd airport_challenge/`.
3. Install dependencies by running `bundle` (you may need to `gem install bundle`).

This program was developed and tested using Ruby 2.4.0. Other versions will likely work, but you may need to modify the `gemfile` first.

## Usage
1. Run `irb` in the project folder.
2. Type `require './lib/airport'` and press enter to load everything.

Then, try out the following:

1. Make a plane: `ryanair_flight_100 = Plane.new` (planes will be airborne when initialized.)
2. Magick an international air transit hub out of thin air: `heathrow = Airport.new`
3. Tell the plane to land: `heathrow.instruct({action: "land", plane: ryanair_flight_100})`
4. Tell the plane to take off: `heathrow.instruct({action: "take off", plane: ryanair_flight_100})`
5. Try making more airports and sending planes on flights:

```
heathrow = Airport.new({capacity: 80}) # number of gates at the airport
schiphol = Airport.new({capacity: 40})

ryanair = Plane.new

heathrow.instruct({action: "land", plane: ryanair})
heathrow.instruct({action: "take off", plane: ryanair})

schiphol.instruct({action: "land", plane: ryanair})
```

*Planes can only take off or land at an airport when the local weather is good. When you initialize a new airport, the chance of the local weather being bad is 20%.*

## Code Examples

Some snippets of **Excellent Code&trade;** below:

### Initializing an Airport
```
class Airport
  attr_reader :gates, :weather, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(args={capacity: DEFAULT_CAPACITY})
    @gates    = []
    @weather  = Weather.new
    @capacity = args.fetch(:capacity)
  end

# ...class methods here
```

### Instructing a Plane
```
def instruct(args)
  raise WeatherError, "Inclement weather" if !check_weather
  action, plane = args.fetch(:action), args.fetch(:plane)

  action == "land" ? land(plane) : take_off(plane)
end
```

### Intricate Model of the Inner Workings of a Real Plane
```
class Plane
  attr_accessor :grounded

  def initialize
    @grounded = false
  end

  def grounded?
    @grounded
  end
end
```

## User Stories
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
