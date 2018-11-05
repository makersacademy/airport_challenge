# Airport Challenge

A project to build an Air Traffic Controller system that controlls the takeoff and landing of planes from airports. Weather is a random factor - planes can only takeoff and land in sunny weather; not stormy.

## Getting Started

Fork and clone project. Run from terminal.

### Prerequisites
```
* Ruby
* Rspec
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

