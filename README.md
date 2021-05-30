Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Instructions
---------

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`
4. Complete the following task:

Task
-----

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
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.



My Solution
-----
A Makers Week 1 weekend challenge using all the skills learned that week. 

* **Languages used**: Ruby
* **Testing frameworks**: RSpec, Capybara with RSpec

### Functional Representation of User Stories

Objects  | Messages
------------- | -------------
Passengers |
Plane  | weather
Airport | land(plane), take_off(plane), initialize(capacity), hangar

### Domain Model

```
Plane <-- weather --> 'stormy'/'sunny'
Airport <-- land(plane) --> planes landed at the airport
Airport <-- take_off(plane) --> planes remaining at the airport
Airport <-- initialize(capacity) --> sets default airport capacity
Airport <-- hangar --> planes at the airport
```

### Additional set up

```
gem install rspec
```

```
gem install rubocop -v 0.79.0
```

```
gem install capybara
```

To run feature tests in `irb`:
```irb
require './lib/airport.rb'
require './lib/plane.rb'
```

### Approach

* BDD approach: Client - User Stories - Feature Test - Unit Test - Implementation
* TDD: RED - GREEN - REFACTOR
* AAA (Arrange, Act, Assert): for arranging and formatting code in Unit Tests.
* Isolation: used RSpec Instance Doubles (verifying doubles) to stand in for Plane class and stub its methods
* Used RSpec `let` to memoize the instance double
* Considered edge cases for:-
  1. planes can only take off from the airports that they are at
  2. planes already flying cannot take off again or be in an airport
  3. planes landed cannot land again and must be in an airport
* Used `rand` method to generate weather randomness
* Used `srand` to attain predictable results for testing weather method
* SRP (Single Responsibility Principle): extracted method responsibilities into private methods
* Used a **constant** to encapsulate magic numbers (airport capacity & % chance of storm).
* Linted with Rubocop
* Focus on refactoring once unit tests pass with green
* IRB feature test with each successful unit test pass
* RSpec feature test with Capybara gem, wrapped the instructions in private methods for readability (SRP).


### Files
| File    | Description |
| ----------- | ----------- |
| README.md  | this readme page :) |
| ./lib/airport.rb  | code for Airport class |
| ./lib/plane.rb  | code for Plane class |
|  ./spec/airport_spec.rb  |  RSpec file containing all the unit tests for Airport  |
|  ./spec/plane_spec.rb  |  RSpec file containing all the unit tests for Plane  |
|  ./spec/feature_spec.rb  |  Rspec feature test  |
| .gitignore  | added ignore vscode settings |
| **all other files** | **as forked from original repo** |

### TODO

* Feature test spec file - am I approaching this correctly?
* Test coverage on Plane class is not 100% on line 5 & 11 - perhaps due to `rand()`? - understand why that area is untested.
* How to decide what seed number to use for randomness in feature tests. 
