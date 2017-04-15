# Makers Academy - Airport Challenge (Week 1 weekend challenge)
```
        ______
        _\____\___
=  = ==(____##____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

I wrote this project over the weekend of Makers Academy Week 1. I was tasked with designing an air traffic control system, where planes could be instructed to land and take off, depending on the weather (which was randomised to be too stormy for a landing/take off 1 in 10 times).

Instructions for use:
- Clone this repo
- Run ```bundle``` to install dependencies
- Run ```rspec``` to view unit tests and feature test

Example usage from the command line:
```
$ irb
irb(main):001:0> require './lib/airport.rb'
=> true
irb(main):002:0> port = Airport.new
=> #<Airport:0x007fb90610e7a0 @capacity=10, @plane_arr=[]>
irb(main):003:0> plane = Plane.new
=> #<Plane:0x007fb90601c6f8>
irb(main):004:0> port.instruct_to_land(plane)
=> #<Airport:0x007fb90610e7a0 @capacity=10, @plane_arr=[#<Plane:0x007fb90601c6f8>], @plane=#<Plane:0x007fb90601c6f8>>
irb(main):005:0> port.confirm_landed(plane)
=> "#<Plane:0x007fb90601c6f8> has landed."
irb(main):006:0> port.take_off(plane)
=> []
irb(main):007:0> port.confirm_takeoff(plane)
=> "#<Plane:0x007fb90601c6f8> has taken off."
```


## User stories:
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

## Process:

The error handling is based on checking the passed plane against the plane array within the airport and against max capacity, as well as checking for storminess.

An edge case still exists where if confirm_takeoff is called passing in a plane which has never been at the airport, it will report that it has taken off. Perhaps this is just a badly worded return string, or maybe there should be a "planes that took off" array to check against so the airport has a log of the coming and goings.

All tests are grouped by context.
The planes array is viewable from outside as some tests were built to rely on checking the size/if a plane is within the array, but this can be removed from the Airport class and will not result in any operational change.
