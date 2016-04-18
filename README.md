Airport Challenge
=================
[![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)
Tree
---------
airport_challenge
- lib
  - airport.rb
  - feature_test.rb
  - plane.rb
  - weather.rb

- spec
  - airport.rb
  - plane_spec.rb
  - spec_helper.rb
  - weather_spec.rb

My approach at solving the challenge
---------
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```

1. I needed classes for airports and planes
2. I needed methods of landing (in the airport class) and confirming a plane has landed (in the plane class)


```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

1. I needed methods of instructing the plane to take off (in the airport class) and confirming a plane has landed (in the plane class)

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

1. I needed a weather class so I could create instances of weather, using randomization so that it would occasionally be stormy.
2. I needed a private method in the airport class which checked if the weather is stormy by calling on the weather class.
3. I needed to raise an error to prevent takeoff when the weather is stormy (in my takeoff method)

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

1. Same as above, but for landing.

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

1. I needed to create a private method that would tell me when the airport had reached capacity.
2. I needed to raise an error when trying to land a plane when the airport is full in the landing method.

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

1. I needed to pass an argument through the initialize method in the airport class, that sets a capacity to the number of planes in an instance of the airport, and where a default value is set by a constant when no argument is passed through (DEFAULT_CAPACITY).

```
Edge Cases
```
1. I needed to raise an error when planes tried to take off from airports they were not at.
2. I needed to raise an error when planes tried to land when they were already landed, or tried to take off when they were already taken-off.


Installation Instructions
-----
- Fork the repo
- Clone the repo to your computer: git clone [repo url]
- Install bundle gem

Code Example (How it's used)
-----
```
airport = Airport.new
plane = Plane.new

Landing a plane:
airport.land(plane)

Instructing a plane to take off:
airport.takeoff(plane)

Checking if a plane is landed or in the air:
plane.landed?

```

Author
-----
Erika Pheby
