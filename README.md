# Airport Challenge

## Context

This is my solution to the makers Airport Challenge. The original repo can be found here https://github.com/makersacademy/airport_challenge

## Approach

I've solved the problem in Ruby.

The solution has 3 main files, one for each main class
  - airports
  - planes
  - weather

Each file has an associated spec file with relevant tests in, however the plane_spec file contains no tests, as the plane class contains no explicit methods.

The program contains protection against a number of edge cases (e.g. the airport instructing a plane to take off, which isn't at the airport).

The majority of the user actions happen through the instances of airports (e.g. instructing planes to take off and land).

When new instances of planes are created, they are assumed to be airborne, and not associated to any airports until explicitly landed.

## Test Coverage

The tests associated with this project have a high coverage (>98%), however the *weather.rb* file has lower coverage. This seems to be mostly because it contains a private method, and I've not yet been able to work out if I should test this, and if so, how.
