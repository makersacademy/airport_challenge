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

Example

An example of testing the code

1. Require the Airport class (automatically requires airplane and weather classes)
2. Create a new airport with a capacity of 30 planes
3. Create a new airplane called 'Boeing UH370'
4. Land this plane at this airport
5. Instruct this plane to take off from this airport


What this looks like in irb
```
2.5.1 :001 > require'./lib/airport.rb'

 => true

2.5.1 :002 > gatwick = Airport.new(30)

 => #<Airport:0x00007fa57c0defc0 @planes=[], @capacity=30,

 @weather=#<Weather:0x00007fa57c0def98 @stormy=false>>

2.5.1 :003 > boeingUH370 = Airplane.new

 => #<Airplane:0x00007fa57c0ce8c8>

2.5.1 :004 > gatwick.land_plane(boeingUH370)

 => [#<Airplane:0x00007fa57c0ce8c8>]

2.5.1 :005 > gatwick.take_off(boeingUH370)

 => "airplane has taken off and is no longer in the airport"

You can also test if it's stormy where at the airport you created by

1. Require the Airport class (automatically requires airplane and weather classes)
2. Create a new airport
3. Call the .stormy method on the weather class to return a true or false as to whether it's stormy or not

2.5.1 :005 > heathrow = Airport.new


 => #<Airport:0x00007f8ab703a5b8 @planes=[], @capacity=20,


 @weather=#<Weather:0x00007f8ab703a590 @stormy=false>>


2.5.1 :006 > heathrow.weather


 => #<Weather:0x00007f8ab703a590 @stormy=false>


2.5.1 :007 > heathrow.weather.stormy


 => false```
