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

By James Ransome

This challenge was completed independently over the weekend after week 1 of the Makers Academy course. The goal was to use a test driven development approach to deliver a program that satisfied the following user stories:

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

My approach was to take these user stories and feature test the requested features in irb. The resulting errors would drive the creation of unit tests written in rspec, which in turn drove the development of production code.

## Specification

- Planes can land and take off from airports. Occasionally when airport weather is stormy, planes will be prevented from arriving and departing
- Airports can be instantiated with a custom capacity. If none is provided, it will be instantiated with a default capacity (30)
- Planes cannot land at airports that are full.
- Planes cannot take off when airborne, nor land when grounded.

## Class methods

Where:
```
airport1 = Airport.new
plane1 = Plane.new
```

#### Airport methods
```
airport1.land(plane1) # Lands plane1 at airport1
airport1.take_off(plane1) # Launches plane1 from airport1
```

#### Plane methods
```
plane1.landed? # Returns true or false
```
