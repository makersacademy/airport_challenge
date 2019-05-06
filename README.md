# Airport Challenge

```
        ______
        _\____\___
=  = ==(__EDINA___)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------.....
                =  ===(_________)
```

## Description

This is the result of the first weekend challenge for submission to Makers Academy. The program controls take off and landing taking the airport capacity and weather conditions into account.

## Getting Started

1. Clone this repo to your local machine using `git@github.com:EdinaBMakers/airport_challenge.git`
2. Run `gem install bundle` (if it is not installed already)
3. Run `bundle`

## Usage
1. Run `irb` in the terminal
2. require `./lib/airport.rb`
3. require `./lib/plane.rb`
4. require `./lib/weather.rb`

## Running Tests
Tests can be run from root directory using the `rspec` command.

## Code Style
I used [Rubocop](https://rubocop.readthedocs.io/en/latest/) before each commit to ensure that Ruby coding standards are followed.

## Task

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

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

## Approach
To complete this exercise:
1. I sketched out the objects and their interactions from the user stories.
2. Then I followed the Test-driven development (TDD) process:
>* Run Feature Test to prove that a feature is missing
>* Add Unit Test(s) for the new feature
>* Run Unit Test(s) (expected to fail)
>* Implement the feature
>* Run Unit Test(s) (expected to succeed)
>* Run Feature Test to prove that a feature is working as expected


#### User Story I.
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

Objects and Messages:

* Airport
  * land
* Plane

Test Cases:

* Plane object can be initialised
* Airport object can be initialised
* Airport has a `land` method with an argument
* Plane can land at airport
* Landed plane is at the airport

#### User Story II.
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

Objects and Messages:

* Airport
  * take_off
* Plane

Test Cases:

* Airport has a `take_off` method with an argument
* Plane is not at airport after take off

#### User Story III.
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

Objects and Messages:

* Airport
  * take_off (not possible in stormy weather)
* Plane
* Weather
  * stormy?

Test Cases:

* Weather object can be initialised
* Weather has a `stormy?` method
* `stormy?` returns `true` if `rand(1..10)` returns `10`
* `stormy?` returns `false` if `rand(1..10)` returns a number other than `10`
* `take_off` raises an error when a plane tries to take off in stormy weather
* Plane can take off if weather is not stormy

#### User Story IV.
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
Objects and Messages:

* Airport
  * land (not possible in stormy weather)
* Plane
* Weather

Test Cases:

* `land` raises an error when a plane tries to land in stormy weather
* Plane can land if weather is not stormy

#### User Story V.
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

Objects and Messages:

* Airport
  * land (not possible if airport is at max capacity)
  * full? (private)
* Plane

Test Cases:

* Airport can accept planes up to capacity
* `land` raises an error when a plane tries to land and the airport is at max capacity

#### User Story VI.
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

Objects and Messages:

* Airport
  * initialize (capacity can be overridden)
* Plane

Test Cases:

* Airport can accept planes up to custom capacity
* `land` raises an error when a plane tries to land and the airport is at custom max capacity

#### Edge Cases
```
Planes can only take off from airports they are in
Planes that are landed cannot land again and must be in an airport
```

Objects:

* Airport
  * land
  * take_off
* Plane

Test Cases:
* `land` raises an error when a plane tries to land at an airport it is already at
* `take_off` raises an error when a plane tries to take off from an airport it is not at

#### Using Stubs

To reduce complexity and ensure deterministic test results, I used stubs to set up the expected value for the randomised weather.

## Test Results and Coverage

All tests pass and `simplecov` reported a test coverage of `100%`.
