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

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.

**NICK BUTLERS README ADDS**

* I create a diagram in mindmup which is available
on my Trello board for the challenge at https://trello.com/b/Bf5aD8Al/saturday-16-5-2020

* I ran feature tests in IRB and unit tests in RSPEC using Red, Green, Refactor, ended all green in RSPEC

* I used rubocop to clean up my code and finished with no faults.

* I did not complete the challenge, I ran out of time before satisfying the final user story. The IRB
runs as below, with a RuntimeError and the expected error message - more work required.
I'm happy I could have resolved this and used it to satisfy the final user story with a little
more time.

**The program is run like this**

2.6.5 :001 > require './lib/airport.rb'\
 => true\
2.6.5 :002 > heathrow = Airport.new\
 => #<Airport:0x00007fae62063340 @planes=[], @capacity=5, @weather=1>\
2.6.5 :003 > heathrow.land("VN001")\
 => ["VN001"]\
2.6.5 :004 > heathrow.land("LG123")\
 => ["VN001", "LG123"]\

2.6.5 :005 > heathrow.storms.take_off("LG123")\
Traceback (most recent call last):\
        5: from /Users/nickbutler/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'\
        4: from /Users/nickbutler/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'\
        3: from /Users/nickbutler/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top\ (required\
)>'\
        2: from (irb):5\
        1: from /Users/nickbutler/Desktop/Makers/airport_challenge/lib/airport.rb:27:in `storms'\
RuntimeError (No take off storms)\
2.6.5 :006 > heathrow.take_off("LG123")\
LG123 has taken off\
 => #<Airport:0x00007fae62063340 @planes=["VN001"], @capacity=5, @weather=1>\
