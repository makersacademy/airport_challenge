Becca Parker's solution to Airport Challenge
============================================

(For original instructions etc from MAKERS, scroll down)

Partial or full solution?
-------------------------
The code and tests I've written in this repo aim to meet all the user stories (see below), but would benefit from some further refactoring - particularly the Rspec. 

I struggled for a long time this weekend tryng to extract the mocks/doubles out into before blocks, but I couldn't get the it blocks to access these objects :( , so I reverted back to longhand declaring the mocks/doubles each time they were needed in an it block.


Next steps / additional features
--------------------------------
Currently the takeoff_plane method can only .pop the next plane out of the planes_in_port array.

If I were to refine this solution further, I'd try to implement a feature to let the user instruct specific planes to take-off. 


How to use
----------
*Load an ATC (Air Traffic Control):*
    irb -r './lib/air_traffic_control'
    weather = Weather.new
    airport = Airport.new() # or add an integer as argument to override DEFAULT_CAPACITY (currently 4)
    atc = ATC.new(weather, airport)
     => #<Weather:0x00007fa8fe8b18f8> 
     => #<Airport:0x00007fa90202e358 @capacity=4, @planes_in_port=[]> 
     => #<ATC:0x00007fa8fe10a578 @weather=#<Weather:0x00007fa8fe8b18f8>, @airport=#<Airport:0x00007fa90202e358 @capacity=4, @planes_in_port=[]>> 


*For this user story:*
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
do this:
  atc.land_plane()
   => "Plane landed" 


*For this user story:*
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
do this:
   atc.takeoff_plane
   => "Confirmation: #<Plane:0x00007fa9020ae8c8> tookoff" 

*For this user story:*
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
do this:
   5.times {atc.land_plane()}
   => RuntimeError (Can't land - airport full)


*For this user story:*
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
do this:
  provide an integer as argument to Airport.new when loading your ATC to override DEFAULT_CAPACITY (currently 4)


*For this user story:*
```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```
do this:
   note that when you land planes, if weather (randomly generated) is stormy you'll get
   => RuntimeError (Can't land - too stormy)


*For this user story:*
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
do this:
   note that when you takeoff_planes, if weather (randomly generated) is stormy you'll get
   => RuntimeError (Can't takeoff - too stormy)



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
