# Airport Challenge!
====================

```
        ______
        _\____\___
=  = ==(____HI____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```
## Introduction

Welcome to my repo for the Makers Academy weekend challenge(1). My task was to test drive the creation of a set of classes/modules to satisfy the user stories below. In order to achieve my goals, I needed to implement guard classes to defend against edge cases, thereby ensuring that the planes in my test were only able to take off from airports that they are currently residing in.

## Useage

```
[1] pry(main)> require "./lib/airport"
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x00007ffc10079a18 @airport_hangar=[], @capacity=5, @taxied_planes=0, @weather=#<Weather:0x00007ffc100799c8>>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x00007ffc100a1068>
```

## Step x Step

In order to be successful at this project, my code **MUST**:
- [x] Instruct a plane to land at the airport.
- [x] Instruct a plane to take off from the airport.
- [x] Confirm that the departed plane(s) are no longer at the airport.
- [ ]  Prevent departures and landings when the weather is "stormy".
- [x]  Prevent arrivals when the airport is full.
- [ ]  Set a default airport capacity that can be overridden as necessary.

## Future goals ##

If I had to repeat this task, I would:
1. Create more conditional factors that enable a plane to land at an airport (i.e size of plane?)
2. Board passengers!
