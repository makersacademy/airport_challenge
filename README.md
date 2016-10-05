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

## Synopsis
----

This is a small 'Air Traffic Control' program, designed to mimic the basic landing and taking off procedures in a small airport.

An 'Airport' object can be created and this can have a (specified) number of 'Plane' objects landing and taking off from it, depending on random weather conditions.


## Motivation
----

The 'Airport Challenge' is the first weekend challenge set by Makers Academy. The purpose of this challenge is for students to apply and build on their TDD (Test Driven Design) knowledge.

## Usage
----
The program can be run from the ruby REPL of your choice. The plane.rb and airport.rb must be 'required' in the REPL session, however weather.rb can be omitted. After crating al least one instance of both the airport and plane classes, the plane object can interact with the airport object via the various methods.

Example: 
```
jfk.land(british_airways_99) 
```
In this example the Airport instance 'jfk' will attempt to land the Plane instance 'british_airways_99'.
