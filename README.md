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

Solution
--------

An example with two planes and an airport in Paris:

```
╰─$ irb
2.6.0 :001 > paris = Airport.new "Paris"
 => #<Airport:0x000055e04003b120 @name="Paris", @planes=[], @capacity=20, @weather=#<Weather:0x000055e04003aba8>>
2.6.0 :002 > plane_1 = Plane.new
 => #<Plane:0x000055e03fc19218>
2.6.0 :003 > plane_1.land_at paris
 => true
2.6.0 :004 > plane_1.location
 => "Paris"
2.6.0 :005 > plane_2 = Plane.new
 => #<Plane:0x000055e03fe33c10>
2.6.0 :006 > plane_2.location
 => "In the air"
2.6.0 :007 > plane_2.flying?
 => true
2.6.0 :008 > paris.count
 => 1
2.6.0 :009 > plane_2.land_at paris
 => false
2.6.0 :010 > plane_2.land_at paris
 => false
2.6.0 :011 > plane_2.land_at paris
 => true
2.6.0 :012 > paris.count
 => 2
2.6.0 :013 > plane_1.take_off
 => true
2.6.0 :014 > plane_1.location
 => "In the air"
2.6.0 :015 > paris.count
 => 1
```

My solution consists of 3 classes: an Airport class, a Plane class and a Weather class. Each class is 
responsible for its own business. The Plane controls it's landing, take off and tracks its own location.
The Airport holds a collection of planes and gives permission to planes to land and take off
depending on reports from the Weather class which just says whether it is stormy or not. In the example
you can see that `plane_2` failed to land twice due to weather before it was finally successful.

Planes are the ones responsible for taking off and landing as they are the ones actully doing the
action (∴ usage is more intuitive). It must however ask the Airport (traffic controllers) for permission
and tests are in place to ensure Plane does call the correct methods to seek permission.

Depending whether it provides permission or not, the Airport then manages its internal storage of planes
so that it can maintain a record of the number of planes and not go over capacity. Given the current
interface of the Airport class this storage of planes isn't strictly necessary as it doesn't do anything
with them and it could be refactored out in favour of just maintaining a count of the planes since the
planes themselves track their current location. I am in two minds about whether it would be best practice
to remove the array now as it is a little superfluous, or it would be best to leave it as future
features (queues, scheduling) would certainly just mean reimplementing it.

Weather class at the minute is rather bare bones and self explanatory.

Further development that I would maybe consider would be:
 - Adding more depth to the weather approximation (weather doesn't just randomly flick from sunny to stormy)
 - Adding scheduling or queues for take off and landing at airports
 - further to scheduling at airports, adding journey time between airports could be considered for planes

**NB** A couple of feature tests are in the spec directory under their own directory although
I would say they leave a little to be desired as far as readability goes.

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
