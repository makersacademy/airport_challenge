## Debora Airport Challenge

[![Build Status](https://travis-ci.org/Debora38/airport_challenge.svg?branch=master)](https://travis-ci.org/Debora38/airport_challenge)

The first Weekend Challenge at Makers Academy included the following summarised steps:

<li> Build an Airport
<li> Make planes land and take off
<li> Keep track of planes in the airport or in flight
<li> Add random weather condition as stormy or sunny
<li> Raise errors when a plane tries to land or take off in a storm
<li> Set an airport capacity
<li> Raise error when a plane tries to land in a full airport

### Goals of the week
Our first week at Makers made us focus on TDD, as in starting from feature test, implementing unit tests and then only code and refactor.
In this challenge, I have noticed how it still comes automated to me, to think about the code straight away, however I made the effort to work on testing first, making myself more familiar with rspec.

### Approach on the challenge
Following the RED, GREEN, REFACTOR cycle, I have first implemented the `Airport` class with its related `spec file`, including methods `land` and `take_off`, without arguments yet.<br><br>
The `Weather` class and related spec followed, implementing stubs to test the randomness of the weather.<br><br>
The `random weather` has then been injected into the `Airport` class with an instance variable `airport_weather` and errors were raised when `land` or `take_off` are called during a storm.<br><br>
The stubs in the `Airport` class spec became repetitive and I finally introduced a `before` block setting a sunny weather situation to test most of the other tests. Only the tests which require a storm include their own stub.<br><br>
Next step was to create a `Plane` class and pass it an instance variable `landed` (initially set to true by default) to keep track of the position of the plane and raising error if a landed plane tries to `land` again and viceversa with `take_off`.<br><br>
`require_relative` and a `plane` instance variable have been passed into the `Airport` class.<br><br>
At this point I noticed that creating a plane along with `Airport.new` brought further problems when trying to `take_off` as the plane was `landed = true` but not present in the `airport_arr`. I therefore first changed the default `landed` status of a new plane to `false`, but then also removed the instance variable from the `Airport` class, leaving only the `require_relative`.<br><br>
Finally the airport capacity was set as `DEFAULT_CAPACITY` but also as an instance variable that can be overwritten.<br><br>
Errors were raised when an airport is full and `land` is called on it.<br><br>
Final refactor thanks also to `rubocop``.
