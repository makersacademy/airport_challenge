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

## Introduction
This is my solution for the airport challenge at Makers Academy completed at the end of week 1.

## Usage Example

```
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fbaa2857b40 @hanger=#<Set: {}>, @capacity=10>
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fbaa283e3e8 @is_flying=true>
2.2.3 :004 > airport.request_landing(plane)
 => #<Set: {#<Plane:0x007fbaa283e3e8 @is_flying=false>}>
 2.2.3 :005 > airport.request_take_off(plane)
 => #<Set: {}>

```
## Installation Instructions

```
$ git clone git@github.com:mannieg/airport_challenge.git
$ cd airport_challenge
```
