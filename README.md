Airport Challenge [![Build Status](https://travis-ci.com/Estevenson1994/airport_challenge.svg?branch=master)](https://travis-ci.com/Estevenson1994/airport_challenge)
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

The aim of this challenge was to design a program that can control the landing and take off of planes at any aiport, given the weather conditions and airport capacity. The following user stories were used to design the program.

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

## Program Classes

The three classes used in this challenge were:

1. Airport
2. Plane
3. Weather

# 1. Airport
Properties:
- capacity - defines the maximum number of planes that can land at the airport. This can either be set when creating a new Airport object or automatically default to 20 if not specified.
- planes - an array which stores the planes that land at the airport

Methods:
- land(plane, weather)

