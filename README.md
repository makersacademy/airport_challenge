# Airport Challenge

## Motivation

My first Makers Academy weekend challenge!  Build software to control the flow of planes at airports, including landing, take-off and handling bad weather!

## Tests

I have written tests, using rspec, to fulfill the user stories as well as edge cases.  For a full list of the tests, please see **airport_challenge/spec/plane_spec.rb** and **airport_challenge/spec/airport_spec.rb**.  Details of the user stories are below in the **User Stories** section

## How to Use

1. Clone this repo, change into the correct directory, then change directory into the **airport_challenge** folder.
2. Open IRB in a terminal window, using the following command:
        **irb -r './lib/plane.rb'**
3. Create a new airport using:
        **airport = Airport.new**
4. Create a new plane using:
        **plane = Plane.new**
5. Experiment with things like airport.land or airport.take_off, creating additional planes and/or airports (check out what parameters need to be passed!)

N.B. A new plane begins airborne, so would need to be landed before it is recognised as being at an airport

## User Stories

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