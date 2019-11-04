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
Stories Completed
-----------------
First feature test in irb:

Admins-MacBook-Air:airport_challenge student$ irb
2.2.3 :001 > airport=Airport.new
NameError: uninitialized constant Airport
	from (irb):1
	from /Users/student/.rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'

# Need to create airport_spec.rb in spec folder and write test:

NameError:
  uninitialized constant Airport
# ./spec/airport_spec.rb:3:in `<top (required)>'
No examples found.

# Need to create the Classs in airport.rb

Admins-MacBook-Air:airport_challenge student$ irb
2.6.0 :001 > class Airport
2.6.0 :002?>   end
 => nil
2.6.0 :003 > airport = Airport.new
 => #<Airport:0x00007fb4fb98b428>
2.6.0 :004 >

# rspec on unit test gives error:

1) Airport should respond to #land
    Failure/Error: it { is_expected.to respond_to :land }
      expected #<Airport:0x00007fbf592f2180> to respond to :land
    # ./spec/airport_spec.rb:4:in `block (2 levels) in <top (required)>'

# Feature test in irb:

Admins-MacBook-Air:airport_challenge student$ irb -r './lib/airport'
2.6.0 :001 > airport = Airport.new
 => #<Airport:0x00007fe07b1e10c8>
2.6.0 :002 > airport.land

NoMethodError (undefined method `land' for #<Airport:0x00007fe07b1e10c8>)

#  Define the method 'land' in lib file

    class Airport
      def land
      end
    end

# rspec result:

    Airport
      should respond to #land

    1 example, 0 failures





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

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **Fix these issues if you can**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
