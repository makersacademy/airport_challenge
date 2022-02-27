# Airport Challenge
#### Welcome to my solution of the airport challenge
[Source](https://github.com/ruiined/airport_challenge)

## Features
* Plane can land in the airport
* Airport stores the plane in the aerodrome
* Airport doesn't let the plane to land if the aerodrome is full
* Airport doesn't let the plane to land if the weather is stormy
* Plane can take off from the airport
* Airport doesn't let the plane to take off if the weather is stormy
* Weather is random, with storm occuring 10% of the time.

## Focus Points of the Challenge
_Test-Driven Development Practices_
* Mocking
* Double and Studs
* Predictable Randomization
* Edge Cases
* Rubocop
* Test Coverage Feedback

## Installation
1. Clone the repository, depending on...
  - HTTPS: `git clone https://github.com/ruiined/airport_challenge.git`
  - SSH: `git clone git@github.com:ruiined/airport_challenge.git`
  - CLI: `gh repo clone ruiined/airport_challenge`
2. Install Ruby 3.0.2 `brew install ruby`
3. Install Gem Bundler `gem install bundler`
4. Run `bundle`

## How to Run
1. `cd airport_challenge`
2. `irb -r 'lib/airport.rb'`
3. `airport = Airport.new`
4. `plane = Plane.new`
5. Feel free to play around with different methods:
  - plane
    - `.land(plane, airport)`
    - `.take_off(plane, airport)`
  - airport
    - `.stormy?`
    - `.receive(plane)`
    - `.release(plane)`

## How to Test
1. `cd airport_challenge`
2. `rspec`