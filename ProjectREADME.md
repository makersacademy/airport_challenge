# Airport Challenge

A project to build an Air Traffic Controller system that controlls the takeoff and landing of planes from airports. Weather is a random factor - planes can only takeoff and land in sunny weather; not stormy.

## Getting Started

Fork and clone project. Run from terminal.

### Prerequisites
```
Ruby
Rspec
```

## Running the Tests

Navigate to parent directory eg.
```
MacBook-Pro-4:airport_challenge user$
```
execute
```
rspec
```

## My Approach to the Challenge

I started by using the user story specifications to develop a [Domain Model](https://github.com/Max-Stevenson/airport_challenge/blob/master/DomainModel.md). This helped me visualise what classes and methods I would need to create.

I used Test Driven Development throughout. I started by running feature tests in [pry](http://pryrepl.org/) and watching them fail. I would then write a test in rspec that would generate a matching failure.

Only then would I write code to pass the tests, before refactoring that code.

I decided that I would need three main classes:

* plane
* airport
* weather

I tried to apply the Single Responsibility Principle to my code and have methods that were only responsible for a single action specific to that class.

### Plane

The Plane class has only two methods as per the first draft of the Domain Model.
```
land_at_airport(airport, weather)

takeoff_from_airport(airport, weather)
```
Each of these methods takes an airport object and weather object as an argument. Initially these methods only had an airport object argument. During the project I modified these methods to factor in weather in order to comply with initial specifications.

### Airport

The Airport class has three methods that differ slightly from the original [Domain Model](https://github.com/Max-Stevenson/airport_challenge/blob/master/DomainModel.md). There is no `check_weather()` method as this function was moved the Weather class.
```
initialize(capacity = DEFAULT_CAPACITY)

confirm_depature(plane)

full?
```
The first method specifies a default capacity for an Airport object in relation to the planes that can be stored. This can be altered if an `Int` argument is passed when an new instance of Airport is created.

The second method takes a plane object and confirms that plane is no longer present in `planes_present`.

The final method checks if the Airport's `planes_present` instance variable is equal to the `capacity`