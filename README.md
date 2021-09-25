Airport Challenge
=================

## Introduction
This program implements software using Ruby, with tests using RSpec, that control the flow of planes at an airport and satisfies the following user stories:

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

I approached this task by initially separating the objects and messages in the user stories as follows:

| Objects | Messages |
| ----------- | ----------- |
| Plane | Can land, can takeoff |
| Airport | Capacity, can have planes land, can have planes takeoff |
| Weather | Stormy, sunny |

There are two test files for the `airport` and `plane` classes. The `airport_spec` tests that planes can land and take off when the weather is sunny, but cannot land if they are already grounded, and cannot take off if they are already in the air. The spec also tests that planes cannot land at an airport when it has reached capacity, and cannot land or take off during stormy weather. The `plane_spec` tests the `grounded` attribute of a `plane` and dictates whether a particular plane is able to land or takeoff accordingly.

## Installation

After forking and cloning this repo, you will need to run gem install bundler. After installation use the bundle command.
```bash
gem install bundler
```

```bash
bundle
```

## Usage

The program can be run within `irb`