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

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

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

**My code - an example**

```
#Once airport.rb has been required, instances of the Plane and Airport classes can be initialized with
'new'.

#Planes have an instance variable, :status, which defaults to flying but will change when the plane lands.

2.5.0 :002 > jumbo_jet = Plane.new
 => #<Plane:0x00007ff6dd13fb60 @status="flying">

#Airports are initialized with three instance variables; :weather, :capacity and :planes. :weather is
randomly set and may be 'fine' or 'stormy'.  :capacity defaults to 20, but may be set by use of an
argument at initialization.  :planes is an empty array used to store planes which land at the airport.

2.5.0 :004 > gatwick = Airport.new(25)
 => #<Airport:0x00007ff6dd135958 @weather="fine", @capacity=25, @planes=[]>

Planes can be landed at a particular airport, but only if :weather is 'fine' and if the :capacity has
not been reached. :weather is randomly set ahead each attempted landing.  On landing, the plane is
stored in :planes and the plane's :status is changed to the airport id.  A plane can only land if
:status == 'flying'

Similarly, planes can take off from an airport, again only if weather permits. A plane can only take
off from and airport it has landed at.  On take off, a plane's :status is changed to 'flying'.  

2.5.0 :005 > gatwick.land(jumbo_jet)
 => [#<Plane:0x00007ff6dd13fb60 @status=#<Airport:0x00007ff6dd135958 @weather="fine", @capacity=25,
 @planes=[...]>>]
2.5.0 :006 > stansted = Airport.new
 => #<Airport:0x00007ff6de083ba8 @weather="fine", @capacity=20, @planes=[]>
2.5.0 :007 > stansted.take_off(jumbo_jet)
Traceback (most recent call last):...

RuntimeError (Plane not at this airport)
2.5.0 :008 > gatwick.take_off(jumbo_jet)
 => #<Plane:0x00007ff6dd13fb60 @status="flying">
```
