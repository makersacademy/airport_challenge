# Mabon ap Gwyn's submission of Week 1's Airport Challenge

I decided to tackle each story one at a time in the order presented above. Each User Story was approached in a TDD manner, i.e. outlining the expectations of all methods associated with both the Airport and Plane classes before implementing them into each class.

A default capacity of 10 is given to an Airport object upon initialization. This can be overridden by passing an integer as an argument e.g.

```
2.6.5 :002 > port = Airport.new(20)
=> #<Airport:0x00007fc7840de5f0 @hangar=[], @capacity=20>
```

### Plane class, :landed, #land and #take_off
Upon initialization of a Plane class, the attribute :landed is assigned to true (despite my limited knowledge of plane construction, I believe they are built while on the ground).
These methods exist for the Plane class to simulate a plane flying. Use #land or #take_off to switch the boolean assigned to :landed. I understand that these methods are arguably surplus to the requirements outlined in the user stories, but they were implemented in an attempt to give the Plane class some identity. Initially, I had integrated a 'weather check' within the Airport class, but upon further thought I decided to implement it within the Plane class and for the method (#stormy?) to be ran every time a #land or #take_off method is called on a Plane instance. The reason for this was that User Stories 5 and 6 suggested that the 'weather check' should be ran prior to take off or landing, which are both methods implemented in the Plane class. All of these methods were approached and constructed using TDD.

```
2.6.5 :003 > plane = Plane.new
 => #<Plane:0x00007fc7840e53f0 @landed=true> 
2.6.5 :004 > plane.take_off
 => "Plane has taken off" 
2.6.5 :005 > plane.landed
 => false 
2.6.5 :006 > plane.land
 => "Plane has landed" 
2.6.5 :007 > plane.landed
 => true 
 ```
 
 ### #stormy?
The #stormy? method returns either true or false (30% chance to return true) and is accessed by both the #land and the #take_off methods within the Plane class. The result of calling this method dictates whether an error is raised and the method is intercepted following the request from the client in User Stories 5 and 6.

```
2.6.5 :016 > plane.take_off
Traceback (most recent call last):
        5: from /Users/Student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/Student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/Student/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):16
        1: from /Users/Student/Documents/MakersAcademy/Projects/Airport_Challenge_Versions/Airport_Challenge_v1/lib/plane.rb:20:in `take_off'
RuntimeError (Weather is stormy)
```

### #dock_landed_plane
This is an Airport class method. By passing a Plane object to this method as an argument, the plane will attempt to dock. Docking a plane will require Plane attribute :landed to equal true before being able to be docked into the hangar.

```
2.6.5 :007 > plane.landed
 => true 
2.6.5 :008 > port.dock_landed_plane(plane)
 => [#<Plane:0x00007fc7840e53f0 @landed=true>] 
```

Error below is raised when attempting to dock a flying plane.

```
2.6.5 :021 > plane.take_off
 => "Plane has taken off" 
2.6.5 :022 > plane.landed
 => false 
2.6.5 :023 > port.dock_landed_plane(plane)
Traceback (most recent call last):
        5: from /Users/Student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/Student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/Student/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):23
        1: from /Users/Student/Documents/MakersAcademy/Projects/Airport_Challenge_Versions/Airport_Challenge_v1/lib/airport.rb:13:in `dock_landed_plane'
RuntimeError (Plane is flying and cannot be docked)
```

An error is also raised when attempting to dock a plane when the :hangar is already at capacity.

### #release_for_takeoff
This is an Airport class method. This releases stored planes.

```
2.6.5 :028 > port.dock_landed_plane(plane)
 => [#<Plane:0x00007fc7840e53f0 @landed=true>] 
2.6.5 :029 > port.release_for_takeoff
 => #<Plane:0x00007fc7840e53f0 @landed=true>
 ``` 
An error is raised when this method is called while the :hangar is empty.

The Airport's :hangar attribute was made private to prohibit access to stored planes from outside of the class. 

The TDD process warranted a total of 16 RSpec tests, all of which pass successfully with 100% coverage of the code base. A rubocop inspection was also ran on the code base, with zero offenses detected.
```
Student@MA123 Airport_Challenge_v1 % rspec

Airport
  #initialize
    defaults capacity
    can specify a different capacity
  #dock_landed_plane
    is able to receive and store plane in hangar if plane is landed
    raises an error if plane is flying
    raises an error if hangar is full
  #release_for_takeoff
    is able to release stored planes for takeoff
    raises an error if no planes are stored

Plane
  #initialize
    is expected to assign :landed to true
  #land
    is expected to revert :landed to true if currently false
    raises error saying that plane is already landed if :landed is true
    raises error if weather is stormy
  #take_off
    is expected to revert :landed to false to emulate a plane taking off
    raises error saying that plane is already flying if :landed is false
    raises an error if weather is stormy
  #stormy?
    likely (7/10 chance) to return false
    unlikely (3/10 chance) to return true

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.07392 seconds (files took 1.03 seconds to load)
16 examples, 0 failures


COVERAGE: 100.00% -- 113/113 lines in 4 files

Student@MA123 Airport_Challenge_v1 % rubocop
Inspecting 6 files
......

6 files inspected, no offenses detected
```

Challenge details are outlined below.

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
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
