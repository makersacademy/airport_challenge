# Airport Challenge

Control airplane flow at an airport.

## Features

```
- Allow plane to land and take off when weather conditions are good.
- Prevent plane from landing when weather conditions are bad.
- Prevent plane from landing if airport is full.
- Allow default airport capacity to be overridden according as required.
- Edge case testing  
```

## Approach

A test driven approach was taken in order to complete this challenge. For each use case, a feature test was written followed by unit testing using RED-GREEN-REFACTOR
method. The tests for each class are isolated using doubles, mocks and stubs in order to ensure a scalable and easily modifiable code base.

The code has three classes - Airport, Plane and Weather. The weather is randomised
to be either sunny or stormy. The plane has two method allowing it to land or take off. The airport has two main methods giving instruction for plane to land and take
off, but there are also checks to determine weather condition and edge cases e.g.
landing a plane which is already in the airport.

## Getting started

`git clone path-to-your-repo`
`bundle`

## Running tests

`rspec`
