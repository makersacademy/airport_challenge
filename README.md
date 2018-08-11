# Airport Challenge

Airport Challenge (see the Makers Github repo [here](https://github.com/makersacademy/airport_challenge "Makers Airport Challenge Github") for more info) responds to the following:

*We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.*

Using my [TDD cycle tree](../blob/tdd_cycle_tree.png) to guide me, I wrote feature tests and then unit tests in order to create a roadmap for my code. Repeating this cycle over and over, simplifying and refactoring the unit tests as required allowed me to be clearer on what was needed in my actual code.

### The TDD and Code Process 

1. Read each user story and write a feature test for it in IRB - e.g. airport.land(plane)
2. Write a unit test (or several) which deal with the error feedback from the feature test. e.g. verify 'Airport' class exists as well as the 'land' method.
3. Write the code which the errors are asking for.
4. Unit test this code and refactor as required.
5. Commit code and push to repo

This challenge helps us to get to grips with two programming fundamentals: TDD and OOP.

The OOP side, in its most basic form, comprises of the following - making a class and instantiating objects from it.

```ruby
class Airport
  def land(plane)
    true
  end
end
```

```ruby
airport = Airport.new
airport.land(plane)
```
