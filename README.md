# Airport Challenge

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

## Makers Academy - Weekend 1 Challenge

A piece of software to control the flow of planes at an airport. The user is able to create instances of airports and planes which can interact with each other in appropriate manners.

Planes are able to take off and land at airports when the weather is sunny and will be prevented from doing so if the weather is stormy.

The state of an airport's weather is determined randomly.

## Getting started

1. Clone this repo `git clone git@github.com:Sindex42/airport_challenge.git`
2. Change directory `cd airport_challenge`
2. Run bundle to install dependencies `bundle install`

## Usage

Use pry or a similar REPL to interact with the program eg.:

```
$ pry
[1] pry(main)> require "./lib/airport"
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x00007fa172bd6170 @capacity=20, @hangar=[], @weather=:sunny>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x00007fa172b9fb48 @landed=false>
[4] pry(main)> airport.land(plane)
=> [#<Plane:0x00007fa172b9fb48 @landed=true>]
[5] pry(main)> airport.take_off(plane)
=> #<Plane:0x00007fa172b9fb48 @landed=false>
[6] pry(main)> airport.in_airport?(plane)
=> false

```

Planes will not be able to land if the airport is at capacity.

```
[10] pry(main)> 20.times { airport.land(Plane.new) }
=> 20
[11] pry(main)> airport.land(Plane.new)
RuntimeError: Airport at capacity

```

 Users can set this capacity at initialization.

```

[12] pry(main)> another_airport = Airport.new(5)
=> #<Airport:0x00007fdae8855ed8 @capacity=5, @hangar=[], @weather=:sunny>
[13] pry(main)> 5.times { another_airport.land(Plane.new) }
=> 5
[14] pry(main)> another_airport.land(Plane.new)
RuntimeError: Airport at capacity

```

## Running tests

Run rspec in root project folder `rspec`
