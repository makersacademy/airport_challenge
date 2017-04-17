# Airport Challenge

This repository contains a software which controls the flow of planes at an airport. The program will emulate planes landing and taking off provided that the weather is sunny. Occasionally, the weather may be stormy, in which case no planes can land or take off.

## My approach

In my TDD I opted on initialising a few instance variables as empty arrays for new objects of the Airport class ('parked planes' and 'en route planes' respectively), a 'weather' instance variable and finally a 'default capacity' instance variable. I chose that for a plane to take off (if the weather is not stormy) from an airport such plane has to be parked within the airport first. The plane will then be moved to the 'en route planes' array and will land if the weather is not stormy and if the airport is not full. The capacity of the airport can be altered after creating an object of the Airport class.

## Project status
This project covers the user stories from User Story 1-5 (please see 'user_stories.txt'). It does not cover User Story 6, which I would have completed by making the capacity configurable on the class level.

## Getting started

`git clone https://github.com/enonnai/airport_challenge.git`

Ruby installation page: https://www.ruby-lang.org/en/documentation/installation/

`gem install rspec`

`bundle install`

## Running tests

Run unit tests from the project folder path via `rspec`

Run feature tests by running irb within the project folder `require ./lib/filename.rb`
