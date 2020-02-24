# Airport Challenge
Makers weekend challenge (week 1)

**Tech used**:
Ruby, 
Rspec, 
Rubocop

## Project aim
To write software to control the flow of planes at an airport.

### Primary aims
* Planes can land and take off provided that the weather is sunny.
* If the weather is stormy the planes cannot take off.
* Planes cannot land if the airport is full.

**Edge cases**
* Planes that are landed cannot land again and must be in an airport.
* Ensuring that planes can only take off from airports they are in.
* Planes that are already flying cannot take off and/or be in an airport.

**User Stories**
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

## Installation instructions
1. Requires Ruby. Instructions to install are [here](https://www.ruby-lang.org/en/documentation/installation/).
2. Fork this repo, and clone to your local machine
3. Run the command `gem install bundle`
4. When the installation completes, run `bundle`
5. This software runs in irb

**Example run-through**
```
>> irb
2.6.5 :001 > require './airport.rb'
 => true 
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007f880110b040 @hanger=[], @capacity=20, @weather=#<Weather:0x00007f880110afa0>> 
2.6.5 :003 > plane = Plane.new
 => #<Plane:0x00007f8801112638 @location=:sky, @status=:flying> 
2.6.5 :004 > airport.land(plane)
 => :landed 
2.6.5 :005 > airport.land(plane)
 => "Plane is already in the hanger" 
2.6.5 :006 > plane = Plane.new
 => #<Plane:0x00007f8802037d20 @location=:sky, @status=:flying> 
2.6.5 :007 > airport.land(plane)
 => :landed 
2.6.5 :008 > p airport.hanger
[#<Plane:0x00007f8801112638 @location=:airport, @status=:landed>, #<Plane:0x00007f8802037d20 @location=:airport, @status=:landed>]
 => [#<Plane:0x00007f8801112638 @location=:airport, @status=:landed>, #<Plane:0x00007f8802037d20 @location=:airport, @status=:landed>] 
2.6.5 :009 > airport.takeoff
 => "A plane has left the airport" 
2.6.5 :010 > airport.takeoff
 => "A plane has left the airport" 
``` 

## Further updating
* I would change the takeoff method to delete planes at their index position rather than removing only the last plane to enter the hanger.
* I would allow the planes to have specific inputted names to allow for easier identification when in the hanger, flying and taking off eg: `plane = Plane.new("Qantas")`.
* If I was to add more airports I'd probably create a hash for the airports that the hangers and planes would then populate.
