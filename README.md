Airport Challenge
=================

## Approach by Claire Nelson

#### Break down the requirements using tables and Excalidraw following techniques learnt in Intro to TDD workshop

- Capture the nouns in the user stories as objects and verbs in user stories as messages. Use the techniques learnt in the first week of Makers to create [object model tables](https://github.com/nelsonclaire/airport_challenge/blob/master/task_stories/user_stories.md) which should assist with how to create the tests, classes and methods for the six user stories worked out with the client.
- Draw a diagram using [Excalidraw](https://github.com/nelsonclaire/airport_challenge/blob/master/task_stories/excalidraw.png) to outline how these interact which each other.


#### Write the most basic first test using techniques learnt in Intro to TDD workshop

- Set up first spec file for airport_spec.rb.
- Update airport_spec.rb on first line to say Require 'airport.rb'.
- Run rspec and see spec file fail.
- Create 'airport.rb' file.
- Run rspec and see spec file pass.
- Write basic first test and see it fail when running rspec.
- Write the minimum code required to pass test following the red-green-refactor process.

#### Debug the error messages produced when running rspec using techniques learnt in Intro to Debugging Workshop

- Work from the top fixing the first error.
- Use the full path of the error line to drill down to the exact code that is erroring.
- Do not be tempted to fix any error other than the one that is being highlighted.
- Move onto the next error message and repeat. 
- Continue until all tests pass.

#### Run irb features tests to confirm that the expected behaviour is being demonstrated

```
Student@MA138C0DL7BH3QD airport_challenge % irb
3.0.2 :001 > require './lib/airport.rb'
 => true 
3.0.2 :002 > airport = Airport.new(40)
 => #<Airport:0x00007fa987875680 @capacity=40, @planes=[]> 
3.0.2 :003 > airportb = Airport.new
 => #<Airport:0x00007fa9871d1ba8 @capacity=20, @planes=[]> 
3.0.2 :004 > plane = Plane.new
 => #<Plane:0x00007fa9871716e0 @flying=true> 
3.0.2 :005 > planea = Plane.new
 => #<Plane:0x00007fa9871ba278 @flying=true> 
3.0.2 :006 > planeb = Plane.new
 => #<Plane:0x00007fa98711a278 @flying=true> 
3.0.2 :007 > planec = Plane.new
 => #<Plane:0x00007fa9871bb858 @flying=true> 
3.0.2 :008 > airport.take_off(plane,airport)
/Users/Student/Projects/airport_challenge/lib/airport.rb:36:in `take_off': Plane cannot take off as not at airport (RuntimeError)
	from (irb):8:in `<main>'
	from /Users/Student/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
	from /Users/Student/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
	from /Users/Student/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :009 > airport.landing(plane, airport)
 => false 
3.0.2 :010 > airport.take_off(plane,airport)
 => true 
3.0.2 :011 > airport.planes
 => [] 
3.0.2 :012 > airport.landing(planeb, airport)
 => false 
3.0.2 :013 > airport.planes
 => [#<Plane:0x00007fa98711a278 @flying=false>] 
3.0.2 :014 > airport.landing(planeb, airportb)
/Users/Student/Projects/airport_challenge/lib/airport.rb:24:in `landing': Plane cannot land as it is not flying (RuntimeError)
	from (irb):14:in `<main>'
	from /Users/Student/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
	from /Users/Student/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
	from /Users/Student/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :015 > airport.landing(planeb, airport)
/Users/Student/Projects/airport_challenge/lib/airport.rb:22:in `landing': Plane cannot land as it is already at this airport (RuntimeError)
	from (irb):15:in `<main>'
	from /Users/Student/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
	from /Users/Student/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
	from /Users/Student/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :016 > airportb.landing(planea, airportb)
 => false 
3.0.2 :017 > airportb.landing(planec, airportb)
 => false 
3.0.2 :018 > airportb.planes
 => [#<Plane:0x00007fa9871ba278 @flying=false>, #<Plane:0x00007fa9871bb858 @flying=false>] 
3.0.2 :019 > airportb.take_off(planea,airportb)
 => true 
3.0.2 :020 > airportb.planes
 => [#<Plane:0x00007fa9871bb858 @flying=false>] 
3.0.2 :021 > airport.planes
 => [#<Plane:0x00007fa98711a278 @flying=false>] 
3.0.2 :022 > airport
 => #<Airport:0x00007fa987875680 @capacity=40, @planes=[#<Plane:0x00007fa98711a278 @flying=false>]> 
3.0.2 :023 > airportb
 => #<Airport:0x00007fa9871d1ba8 @capacity=20, @planes=[#<Plane:0x00007fa9871bb858 @flying=false>]> 
```

#### What I know I need to work on
- I have created Weather as a module as modules were mentioned but I am unclear if I have used it correctly since the documentation says to use test doubles and I have not implemented that in my code.



---

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
* You must submit a pull request to this repo with your code by 10am Monday morning

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
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 10am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 10am.
