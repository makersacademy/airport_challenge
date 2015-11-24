Airport Challenge
=================

Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning
* If you do not submit a pull request, we will not be able to see your progress

Steps
-------

1. Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_november2015 (edit week 1 - you can edit directly on Github)
2. Fork this repo, and clone to your local machine
3. Run the command `gem install bundle`
4. When the installation completes, run `bundle`
3. Complete the following task:

Task
-----

We have a request from a client to write the software to support an air traffic controller managing the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can provide waiting passengers with information 
I want to ask a plane if it has landed 

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Your code should defend against inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport.

Please create separate files for every class, module and test suite.

The submission will be reviewed using the following criteria:

* Supporting Files:
  * [ ] README has been updated with description of your approach
  * [ ] README has been updated with 'how to use' instructions
* Testing set up:
  * [ ] Uses named subject with `described_class`
  * [ ] Uses `context` and `describe` blocks to create test scopes
  * [ ] Avoids Vacuous tests
  * [ ] Use `before` blocks to set up objects rather than repeat code
  * [ ] Sufficient [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md)
  * [ ] Avoids multiple `expect`s in `it` block
  * [ ] Handles randomness in tests
  * [ ] Eliminates redundant `respond_to` expectations
  * [ ] Tests all green
* Application Code:
  * [ ] Naming conventions match the domain model
  * [ ] Has no commented out code
  * [ ] Conditionals are refactored to minimum possible
  * [ ] Uses implicit return of booleans
  * [ ] Does not expose internal implementation
  * [ ] Classes and methods have clear single responsibilities
  * [ ] Methods are short
  * [ ] Avoids magic numbers
  * [ ] Prefers symbols to strings
  * [ ] Methods are named as commands OR queries
  * [ ] Makes correct use of attr_* methods
  * [ ] Avoids redundant lines of code 


**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **You should pay attention to these - the results will be added to your pull request**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
