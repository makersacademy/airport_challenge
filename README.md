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
# Airport Challenge

This Airport challenge allows users to instruct a plane to land and take off from an airport, but only if the weather is sunny!

## Getting started

- First step - Fork this repo and clone it to your local machine
- Second step - Run the command gem install bundler (if you don't have bundler already)
- Third step - When the installation completes, run bundle


## How to use

Now, I know you're excited to get your pilot's hat on, but please read these instructions first, which will walk you through how to test my program. 

- Open your terminal and navigate to the Airport_challenge directory 
- Run irb and require './lib/airport.rb'
- You can create plane instances (plane = Plane.new) and airport instances (airport = Airport.new).
- To instruct a plane to take off from an airport you can use the 'takeoff' method (airport.takeoff(plane))
- To instruct a plane to land you can use the 'land' method (airport.land(plane))
## Some things to note
- The airport's default capacity is set to 10 planes, so if you would like to change the airports default capacity, you can pass your desired capacity as an integer to the airport instance eg (airport = Airport.new(20))
- You will only be able to land and take-off planes if the weather is sunny. Luckily, the weather is sunny 75% of the time, and stormy the other 25%. 

## Running tests

- If you would like to run my unit tests, run rspec in the Airport_challenge directory.

## User stories

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
