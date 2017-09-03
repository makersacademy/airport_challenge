# Project: Airport Challenge

This project models the flow of planes at an airport, depending on the weather.

There are three objects in this project (airport, plane, weather) whose code can be found in the ./lib folder, with the accompanying tests within the ./spec folder.

## My Approach

I started this project writing tests for the Airport class, without taking weather into consideration. The airport would be able to accept an instance of a class called 'plane' for landing, and for taking off. I would then proceed to write the code on the lib file.

After making sure my tests pass and that my feature tests run, I would then repeat the process of adding more tests (e.g. capacity constraints), implementing them into code, passing tests...etc. A detailed walkthrough of changes can be seen in my commit history.

I then wrote a test for a new class called Weather, which has a default 'chance of storm' at initialization, and depending on randomness, determines if the weather is stormy or not stormy.

Creating an instance of Airport then automatically generates an instance of Weather, where if it is stormy, does not allow planes to take off or land.

## Getting Started
 1. Fork this repo into your machine
 2. Run the command 'gem install bundle' form your terminal
 3. Once that is done, run bundle

## Usage
  1. To run the program you must first enter 'require ./lib/airport.rb' into your terminal
  2. Create an instance of the Airport class (e.g. airport = Airport.new)

  This creates an airport with a default capacity for planes, and generates a random weather condition (stormy or not stormy). Stormy conditions will raise errors for any planes trying to land or take off. If the airport has stormy weather at creation, you should find another airport (i.e. create a new Airport instance) with safer conditions.

  The airport instance can be given 1 argument at creation, setting a capacity for planes.

  3. Create instances of the Plane class

  Created planes can land at the airport, provided that the airport is not yet at full capacity. They are able to successfully land and take off only once, in that order.

## Running tests
  Run the 'rspec' command on this repo in order to run tests.
  Tests have a high (~99%) coverage for the program.
