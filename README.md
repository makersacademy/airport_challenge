# Airport Challenge


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

## Introduction

Airport Challenge is a simple Ruby program that simulates an airport and meets the requirements of six user stories ([outlined below](#user-stories))  

The code and tests in this repo are my response to the first Makers Academy weekend challenge for the July 2021 cohort: in particular, it challenged me to think and learn more about TDD/BDD, RSpec, Ruby, and debugging.  

The coding aspect of this task was not too tricky: it built upon the 'Boris Bikes' pair programming activity that we worked through in week one.  

The main challenge was maintaining a TDD mindset and using RSpec (especially thinking about doubles and mocks in the tests, and ensuring my tests were actually testing what I wanted them to!)  

I have not deleted any of my unit tests from the spec files, this is in order to show how my thinking developed, and the program emerged, over the course of the challenge.  

## Installation instructions


```
git clone https://github.com/edpackard/airport_challenge.git
gem install bundler
bundle
```

## How to use this program


Open `irb` from the command line and `require` the `airport.rb` file. If you are in the `airport_challenge` directory, `require './lib/airport'` will open the program.

* To generate an airport: `airport_variable = Airport.new`
* To generate an aeroplane: `aeroplane_variable = Plane.new`
* You can generate as many airports and planes as you like.
* By default, the airports are generated empty and with a capacity of 10 planes.
* To specify a different capacity, pass a positive integer when generating the airport:   
  `big_airport = Airport.new(200)`
* By default, planes are generated 'in flight' - to land them, use `land`:  
  `airport_variable.land(plane_variable)`
* To check that a plane is in the airport, use `contains?`:   
  `airport_variable.contains?(plane_variable)`
* You can also view the contents of the airport's hangar:  
  `airport.hangar`
* A plane cannot take off if it is already in flight, and a plane cannot land if it is already on the ground.  
* A plane cannot take off from an airport unless it is at that airport.  
* A plane cannot land at an airport that has reached its capacity.  
* The weather is generally fine, but occasional storms will prevent landings and take offs.

## How to run the tests


To run the RSpec tests, run `rspec` from the `airport_challenge` directory. This will run all the unit tests and the feature test. To run individual test files, put the file path after `rspec`, such as `rspec ./spec/airport_spec.rb`

The feature test is a simple set of commands that land, take off and check several planes at the same airport. Line 7 of `feature_spec.rb` deactivates the random weather generator, and makes sure it is always sunny. It can be commented out for a 100% authentic feature test environment, but the program will occasionally raise errors when it is stormy!

## User Stories


We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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
