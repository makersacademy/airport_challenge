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

This repository contains the Makers Academy week 1 homework challenge. The code is run on the command line and
allow you to create airports that let you land and take off planes, provided that the weather is not stormy. if the weather is stormy no take offs or landings are allowed. To ensure safety when an airport is at full capacity no more airplanes can land, this capacity can be set when you create the airport instance.

To use this on the command line: clone this repo, navigate to that folder in your command line, open up irb and then require './lib/airport.rb'

commands
Airport.new - creates a new instance of an airport
land_plane(plane) - method called on an airport instance, lands a plane at the airport. plane should be a Airplane object
take_off - method called on an airport instance, currently takes off the last plane to land at the airport.

Example

An example of testing the code

1. Require the Airport class (automatically requires airplane and weather classes)
2. Create a new airport with a capacity of 30 planes
3. Land a plane at this airport
4. Instruct a plane to take off from this airport

What this looks like in irb
