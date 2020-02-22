Airport Challenge
=================

A ruby program created to simulate the flow of planes to and from an airport with planes taking off or landing in good weather.

###To run tests

Clone or download the repository and then run the following for unit or feature tests.

##To run unit tests with RSpec

Navigate to the parent directory and run:

```
rspec
```

###To run feature test

Navigate to the same file location and run

```
ruby feature_test.rb
```

##User stories addressed:

####User story

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
####Feature test

```
airport = Airport.new
plane = Plane.new
plane.land
```

To test this behaviour in my unit test I checked to see if the plane.land command would raise an error.

####User Story
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

####Feature test

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

####Results of the feature test:

```
feature_test.rb:6:in `<main>': undefined method `take_off' for #<Plane:0x00007f82d80fef30> (NoMethodError)
```

The next unit tests will now test that the method doesn't raise this error and that the method empty lets the controller see if the plane is in the airport.

####User Story

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

####Feature test

```
airport = Airport.new
plane = Plane.new
plane2 = Plane.new
plane2.land
```

This should throw an error and stops the second plane from landing. Getting the plane object to throw the error was more difficult than anticipated as the require pathways were not recognising an initialized airport to perform the empty? function - which was the logical basis for the raised error.

Initializing the airport in the plane class itself will cause more issues down the line, but it was the most simple code required to pass the test and throw the needed error.

####User story

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

####Feature tests

The default capacity for the airport will be 5 planes.

```
airport = Airport.new(20)
puts airport: :capacity
```

This will test state and not behaviour. As a designer for the system you should be able to see your software being used in multiple airports with varying capacities for the amount of planes. The easiest way to see if it can be adapted is by how many planes are able to take off and land as an extension of the controllers role, allowing planes to take off and to land.

The land and take off functions should be updated to let the airport count the number of planes it stores. This will be reflected in the new feature tests and be updated in the current unit tests.

```
airport = Airport.new(10)
plane = Plane.new
10.times { airport.land(plane) }
```
The capacity of this airport has been set to 10 so this should not throw any errors

```
airport = Airport.new()
plane = Plane.new
10.times { airport.land(plane) }
```
This should give us an error because too many planes are being landed and so the airport is full. Our earlier test for empty or full should now take over.

This feature test should pass:

```
airport = Airport.new()
plane = Plane.new
5.times { airport.land(plane) }
```

This one should not:

```
airport = Airport.new(3)
plane = Plane.new
5.times { airport.land(plane) }
```

####Result is:

```
Makerss-Air:airport_challenge student$ ruby feature_test.rb
Traceback (most recent call last):
	3: from feature_test.rb:6:in `<main>'
	2: from feature_test.rb:6:in `times'
	1: from feature_test.rb:6:in `block in <main>'
/Users/student/Documents/projects/airplane_challenge/airport_challenge/lib/airport.rb:13:in `land': The airport is full (RuntimeError)

```
I then refactored my tests to avoid repeating the "airport is full error". Other unit tests were updated to respond to the updated methods land and take_off being used by the airport class and taking plane as a parameter.

####User Story

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

####Feature test

```
airport = Airport.new()
plane = Plane.new
weather = is_it_stormy?
airport.take_off(plane)
```
This should give us an error and stop the plane from leaving.

```
Makerss-Air:airport_challenge student$ ruby feature_test.rb
Traceback (most recent call last):
feature_test.rb:6:in `<main>': undefined method `is_it_stormy?' for main:Object (NoMethodError)
Makerss-Air:airport_challenge student$
```

Yes, great. Now more tests. Until we get this:

```
airport = Airport.new()
plane = Plane.new
airport.is_it_stormy?
airport.take_off(plane)
```

```
Makerss-Air:airport_challenge student$ ruby feature_test.rb
Traceback (most recent call last):
	1: from feature_test.rb:7:in `<main>'
/Users/student/Documents/projects/airplane_challenge/airport_challenge/lib/airport.rb:20:in `take_off': Bad weather, no taking off (RuntimeError)
Makerss-Air:airport_challenge student$

```

####User Story

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

####Feature test

```
airport = Airport.new()
plane = Plane.new
airport.is_it_stormy?
airport.land(plane)
```

To maintain the DRY principle I created a new method that would be called during landing to stop planes when the weather is bad.

####Results from feature test:

```
Makerss-Air:airport_challenge student$ ruby feature_test.rb
Traceback (most recent call last):
	2: from feature_test.rb:7:in `<main>'
	1: from /Users/student/Documents/projects/airplane_challenge/airport_challenge/lib/airport.rb:15:in `land'
/Users/student/Documents/projects/airplane_challenge/airport_challenge/lib/airport.rb:40:in `stops_planes': Bad weather, no landing (RuntimeError)
Makerss-Air:airport_challenge student$
```

##Updating exceptions

Now that all of the user stories are catered to I want to expand my unit and feature tests to ensure that the weather conditions can be changed. Meeting the conditions of these specifications:

>You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

>Your code should defend against edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

###Weather tests

```
airport = Airport.new()
plane = Plane.new
airport.it_stormy?
airport.land(plane)

airport = Airport.new()
plane = Plane.new
airport.it_stormy?
airport.take_off(plane)

```
###Results show errors firing:

```
Makerss-Air:airport_challenge student$ ruby feature_test.rb
Traceback (most recent call last):
	2: from feature_test.rb:7:in `<main>'
	1: from /Users/student/Documents/projects/airplane_challenge/airport_challenge/lib/airport.rb:17:in `land'
/Users/student/Documents/projects/airplane_challenge/airport_challenge/lib/airport.rb:41:in `stops_planes': Bad weather, no landing (RuntimeError)
Makerss-Air:airport_challenge student$ ruby feature_test.rb
Makerss-Air:airport_challenge student$ ruby feature_test.rb
Traceback (most recent call last):
	2: from feature_test.rb:7:in `<main>'
	1: from /Users/student/Documents/projects/airplane_challenge/airport_challenge/lib/airport.rb:17:in `land'
/Users/student/Documents/projects/airplane_challenge/airport_challenge/lib/airport.rb:41:in `stops_planes': Bad weather, no landing (RuntimeError)
Makerss-Air:airport_challenge student$ ruby feature_test.rb
Makerss-Air:airport_challenge student$ ruby feature_test.rb
Traceback (most recent call last):
	1: from feature_test.rb:12:in `<main>'
/Users/student/Documents/projects/airplane_challenge/airport_challenge/lib/airport.rb:24:in `take_off': Bad weather, no taking off (RuntimeError)
Makerss-Air:airport_challenge student$

```

Tests currently not able to apply or limit the random weather conditions to properly set the test conditions.
