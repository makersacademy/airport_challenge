Airport
=======

![Alt text](https://github.com/JessicaBarclay/airport_challenge/blob/master/links/airplane_lounge.jpg "airport-lounge")


Explained
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  


Here are the user stories that the program should consider:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

### You can create an Airport, land planes, park them in the hangar and then takeoff again!
### Weather permitting - You can rely on grade A air traffic controllers to help you out.

### How to run...


```ruby
irb
require './lib/airport'
```

```ruby
gatwick = Airport.new # creates a new airport with a default capacity of 10
heathrow = Airport.new(18) # customise capacity when instantiating airport class
heathrow.land(Plane.new) # land planes in the airport, watch out for stormy weather!
heathrow.hangar # this will return the @hangar array containing the Plane objects
heathrow.takeoff # again watch out for bad weather conditions!
```


### Obstacles encountered upon creating the program...

1. Pinning down the responsibilities of classes

- Should the Plane or the Airport have the behaviour of landing and takeoff? I put a lot of thought into this
  early on, as I knew it was one of the key factors of the program. I decided to choose Airport, as the
  User storied all refer to the 'air traffic controller' needing to carry out the tasks of safe landing/takeoff.

- When returning error messages and confirmation of a successful landing or takeoff,
  I decided to pass this behaviour to Plane - which are executed when the Plane object has carried out specific functions.
  This isolates these methods, and remove any hard-coded statements in the Airport methods.

2. Writing concise, DRY tests to get the maximum test coverage using RSpec

- Though written in Ruby, RSpec is a whole new experience for me. I wanted my program to test for all
  edge cases I encountered during feature tests, this meant learning a number of new RSpec concepts and syntax.

- Mocks, doubles, and stubs. These are all new words in my programming vocabulary, and they were the biggest challenge
  I faced when writing the unit tests. Particularly for the random_condition method from within the Weather class.

3. Knowing when the program is complete

4. Following TDD principles of Red-Green-Refactor


### Test coverage = 96.77%


![Alt text]( https://github.com/JessicaBarclay/airport_challenge/blob/master/links/test-coverage.png "test-coverage")
