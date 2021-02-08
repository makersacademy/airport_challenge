# Airport Challenge

## What is the Airport Challenge?

This project is the first weekend challenge at Makers. It is designed to test knowelege and implementation of TDD.
The aim is to satisfy a set of user stories based around what an air traffic controller would need to direct planes to land and takeoff safely.
The conditions that the user of this program can check include: checking if a plane has landed or taken off, checking if it is safe to land based on if the airport has reached maximum capacity and also allows the user to override the default airport capacity if needed.


## Getting Started

    git clone https://github.com/Laura-Keen/airport_challenge.git

    gem install bundle

    bundle


## How To Run Tests

All of the tests are written using Rspec, in order to run the tests, first install Rspec and then use the `rspec` command in the command line.

## Notes

I have not completed this challenge fully, I still need to create a random weather generator and tests to ensure planes do not land and take off when the weather is stormy.
To do this I would make an array with the possible weather conditions and use the `sample` method to generate them randomly.
I would then make an error for when the `takeoff` method is called if the random weather condition is equal to stormy.
I would also make an error for when the `land(plane)` method is called if the random weather condition is equal to stormy.
