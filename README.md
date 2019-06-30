Airport Challenge
=================

## Approach - Matt Thompson

#### Break down the problem

- Write out [user stories](https://github.com/mattTea/airport_challenge/blob/master/problem/user_stories.md)
- Capture objects (nouns in user stories) and messages (verbs in user stories) to create a simple [object model table](https://github.com/mattTea/airport_challenge/blob/master/problem/user_stories.md)
- Draw a diagram to outline how objects interact
- Break this down further into the [simplest things](https://github.com/mattTea/airport_challenge/blob/master/problem/user_stories.md#prevent-take-off) the program can do


#### Write minimum first test

- Set up first spec file
- Require 'airport.rb' in spec file -> fail
- Create 'airport.rb' file
- Write minimum first test and watch it fail
- Write mimimum code to pass test and follow red-green-refactor [process](https://github.com/mattTea/airport_challenge/blob/master/problem/TDD-screen-recording-airport.mp4)


#### Follow error messages when running rspec

- Fix only what the failing test is suggesting (i.e. ArgumentError)
- Follow the next error and keep repeating until the test passes


#### Regularly run irb features tests to check expected behaviour

- Example - checking edge cases such as preventing planes taking off that are not already in the airport


#### Example running of program

```
airport_challenge git:(master) ✗ irb -r ./lib/airport.rb
2.5.0 :001 > airport = Airport.new(10)
 => #<Airport:0x00007fd90a8cab00 @planes=[], @capacity=10> 
2.5.0 :002 > plane1 = Plane.new
 => #<Plane:0x00007fd90a8e2138> 
2.5.0 :003 > airport.land_plane(plane1)
 => [#<Plane:0x00007fd90a8e2138>] 
2.5.0 :004 > plane2 = Plane.new
 => #<Plane:0x00007fd90b132fb8> 
2.5.0 :005 > airport.launch_plane(plane2)
Traceback (most recent call last):
        3: from /Users/mattthompson/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):5
        1: from /Users/mattthompson/Documents/dev-projects/Makers/Projects/Week_1/airport_challenge/lib/airport.rb:26:in `launch_plane'
RuntimeError (Plane cannot take-off, not in airport.)
2.5.0 :006 > airport.land_plane(plane2)
 => [#<Plane:0x00007fd90a8e2138>, #<Plane:0x00007fd90b132fb8>] 
2.5.0 :007 > airport
 => #<Airport:0x00007fd90a8cab00 @planes=[#<Plane:0x00007fd90a8e2138>, #<Plane:0x00007fd90b132fb8>], @capacity=10> 
2.5.0 :008 > airport.launch_plane(plane2)
 => [#<Plane:0x00007fd90a8e2138>] 
2.5.0 :009 > airport
 => #<Airport:0x00007fd90a8cab00 @planes=[#<Plane:0x00007fd90a8e2138>], @capacity=10> 

```


#### Thoughts and follow-up research

- Getting the methods on right class, and ensuring the tests were testing the right things was an iterative process
  - Initially placed `land` and `take_off` methods on the `Plane` class based on the structure of the user stories, but soon moved across to the `Airport` class when I found that the methods would need to manipulate the airport rather than the planes
  - Similarly iterative were the tests around setting capacity

- Creating `Weather` as a module, its only method (`stormy?`) is tested as an extended instance method on the `Airport` class. However, this is not shown in the test coverage stats, and shows this module as almost entirely untested
  - So far have been unable to rectify this, more research required!

---



Challenge README
================


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

* Challenge time: rest of the day and weekend, until Monday 9am
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

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **Fix these issues if you can**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
