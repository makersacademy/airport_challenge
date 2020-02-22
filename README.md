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

To test this behaviour in my unit test I checked to see if the plane.land command would raise an error.

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

Feature test

```
airport = Airport.new
plane = Plane.new
plane.take_off
plane.take_off
```
This feature test should raise and error because the plane has left the airport.
You can also run a feature test to let the user look at the airport and see that the plane is no longer there, like so:

```
airport = Airport.new
plane = Plane.new
plane.take_off
airport.empty?
```
This should return the value true as the plane is no longer there. I think this second feature test is more robust than the first because it speaks directly to the user specifications, giving the controller the ability to look and check if the plane is there. The first test does test behaviour but does not directly address the check functionality that we want out airport to have.

Results of the feature test:

```
feature_test.rb:6:in `<main>': undefined method `take_off' for #<Plane:0x00007f82d80fef30> (NoMethodError)
```

The next unit tests will now test that the method doesn't raise this error and that the method empty lets the controller see if the plane is in the airport.

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

Feature test

```
airport = Airport.new
plane = Plane.new
plane2 = Plane.new
plane2.land
```

This should throw an error and stops the second plane from landing. Getting the plane object to throw the error was more difficult than anticipated as the require pathways were not recognising an initialized airport to perform the empty? function upon - which was the logical basis for the raised error.

Initializing the airport in the plane class itself will cause more issues down the line, but it was the most simple code required to pass the test and throw the needed error.
