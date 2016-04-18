[![Build Status](https://travis-ci.org/hkp108/airport_challenge.svg?branch=master)](https://travis-ci.org/hkp108/airport_challenge)

Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__   HP   __..----..__                )
                `---~~\___________/------------`````
                =  ===(_________)

```

About
---------

This repository contains the solution to the Airport challenge. 
The software controls the flow of planes at an airport whereby planes can land and take off if weather is good. Safety measures are put in place to prevent airplanes from landing or taking off if the weather is stormy.

Here are the user stories that enabled me to write the software using BDD:

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

Instructions
---------

Installation:

1. Run the command `gem install bundle`
2. When the installation completes, `run bundle`

To run, in irb:

```
2.2.3 :002 > require './lib/airport.rb'
 => true
```


To create new Airport:

```
2.2.3 :002 > airport = Airport.new(20)
 => #<Airport:0x007f9d640f4188 @planes=[], @current_weather=:rainy, @capacity=20>
```

-Default capacity has been set to 5, but can be set to desired number by passing it as an argument.

To create Plane:

```
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007f9d64104588 @landed=false>
 ```

-The plane is initialised as flying and does not belong to any airport.

To control landing/take off:

```
2.2.3 :004 > airport.land(plane)
 => [#<Plane:0x007f9d64104588 @landed=true>] 
```
```
2.2.3 :005 > airport.take_off(plane)
=> [#<Plane:0x007f9d64104588 @landed=true>] 
```

Weather can be changed by calling `weather method` on airport object. The weather is sampled at random and can be checked using `current_weather` method on airport object. 75% of the time, the weather will be good enough to land or take off. However, this percentage can be changed in the weather module as required.


Author
---------

Harsheet Patel






