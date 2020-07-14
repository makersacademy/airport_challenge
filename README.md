# Airport Challenge
=================

## Project

This project aims to simulate airports and planes interacting by landing and taking off.

## Features not yet implemented

It should also include a weather simulation feature preventing takeoffs and landings during stormy weather.

## Getting started

'git clone https://github.com/02ship/airport_challenge.git'

## Usage

'irb'
require './lib/airport'

## Running tests

'rspec'

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

## Completed stories

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

```

## Stories yet to be completed

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
