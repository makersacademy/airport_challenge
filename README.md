# Airport Challenge README

## Setup

Initialise IRB and require the following files:

airport.rb
plane.rb
weather.rb

Create relevant objects by calling <object_name> = <Object>.new

In the case of creating an airport, should a custom capacity be required, this can be specified as follows:

<airport_name> = Airport.new(custom_capacity)

## Using the program

1. Airport functions
..1. Instruct to land ( instruct_to_land(plane) )
Instruct a plane land at the airport

..2. Instruct to takeoff ( instruct_to_land(plane) )
Instruct a plane to take off from the airport

..3. Check clearance for take off or landing ( clearance(weather) )
Confirm whether the weather is permissible to landing or takeoff

..4 Confirm status of plane ( confirm_status(plane) )
Enquire whether specified plane is landed (at the given airport), or in flight


2. Plane functions

..1. Land plane ( land )

Lands the plane. Will only land at an airport if instructed directly by the airport.

..2. Land plane ( take_off )

Takes off the plane. Will only land at an airport if instructed directly by the airport.
