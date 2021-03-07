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
Introduction
---------

Solution to the Makers Week 1 Weekend Challenge - airport_challenge by Jack McCarthy (jackmcc08).

The program was developed entirely via TDD, and I attempted to apply encapsulation and SRP principles as much as possible, as well stick as strictly as possible to TDD methods.

I developed the 6 user stories below via TDD and you can see my initial domain models, pseudocode and diagrams in 'airport_notes.md'.

On completion of the 6 user stories, I then developed some edge case user stories and TDD impelmented them (also available in the notes markup).

Throughout I attempted to refactor the code and slimmed down the tests.

On completion:
- all user stories were delivered
- all RSPEC tests passed
- there was 100% test coverage
- there were no Rubocop errors

My concerns/potential style violations:
- I use .send in the airport class to access the Plane private methods to change the plane status when it lands/takes off. I did this to avoid the user being able to change the plane status directly rather than through an airport method but this solution violates encapsulation.
- Was not sure how to build a feature_spec, I had a go but do not think it is what is considered a standard feature_spec.rb.

Have fun!

Instructions for use
----------
#### RSPEC Testing
In the project folder run rspec to show test demonstration, it will give you an overview of the functionality of the program.

#### IRB

To operate the program in IRB, open with below commands. Suggested to create airport instances and plane instances to enable manipulation of program.

All classes and methods listed below this section.

```
$ irb
2.6.5 :001 > require './lib/airport.rb'
 => true
2.6.5 :002 > heathrow = Airport.new(20, "Heathrow")
 => #<Airport:0x00007f8dae891528 @airport_capacity=20, @planes=[], @name="Heathrow">
2.6.5 :003 > julius_747 = Plane.new
 => #<Plane:0x00007f8dab9b75e0 @status={:flying=>true, :location=>"The Sky!"}>
2.6.5 :004 > sky_falcon = Plane.new
 => #<Plane:0x00007f8dab9be020 @status={:flying=>true, :location=>"The Sky!"}>
2.6.5 :005 > heathrow.request_to_land(julius_747)
 => "Plane has landed."
2.6.5 :006 > heathrow.planes
 => [#<Plane:0x00007f8dab9b75e0 @status={:flying=>false, :location=>#<Airport:0x00007f8dae891528 @airport_capacity=20, @planes=[...], @name="Heathrow">}>]
2.6.5 :007 > heathrow.airport_capacity
 => 20
2.6.5 :008 > heathrow.request_to_take_off(julius_747)
 => "Plane has taken off."
2.6.5 :009 > julius_747.location
 => "The Sky!"
2.6.5 :010 > heathrow.request_to_land(sky_falcon)
 => "Plane has landed."
2.6.5 :011 > sky_falcon.location
 => #<Airport:0x00007f8dae891528 @airport_capacity=20, @planes=[#<Plane:0x00007f8dab9be020 @status={:flying=>false, :location=>#<Airport:0x00007f8dae891528 ...>}>], @name="Heathrow">
2.6.5 :012 > sky_falcon.flying?
 => false
```

#### Classes and Methods

- Class: Airport
  - Create with Airport.new(capacity, name)
    - capacity is optional integer, will default to 10 if not passed
    - name is optional string, will default to 'test_airport' if not passed

  - Methods:
    - .request_to_land(plane) - use this method on Airport instances, passing a Plane instance to land a plane at the airport (Plane instance must be flying)
    - .request_to_take_off(plane) - use this method on Airport instances, passing a Plane instance to take off that plane at the airport (Plane instance must be landed at that Airport)
    - .airport_capacity (allows you to see max capacity of the airport)
    - .planes (allows you to see what planes are at the airport)
    - .name (allows you to see the airports name)

- Class: Plane
  - Create with Plane.new
  - Methods:
    - .location (allows you to see the plane instance location)
    - .flying? (tells you if the plane instance is flying or not)



Challenge Instructions
---------

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
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
