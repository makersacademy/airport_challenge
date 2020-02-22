Airport Challenge
=================

A ruby program created to simulate the flow of planes to and from an airport with planes taking off or landing in good weather.

###To run tests

Clone or download the repository and then run the following for unit or for feature tests.

##To run unit tests with RSpec

Navigate to the parent directory of spec and lib and then run:

```
rspec
```

###To run feature tests

Navigate to the same file location and run

```
ruby feature_test.rb
```

##User stories addressed:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
Feature test:

```
airport = Airport.new
plane = Plane.new
plane.land
```
