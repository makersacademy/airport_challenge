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

Challenge
---------

To write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. See [Domainmodel.md](https://github.com/memunyawiri/airport_challenge/blob/master/Domainmodel.md) in file tree for supporting user stories & w.i.p domain model.

*Task:* To test drive the creation of a set of classes/modules to satisfy all the user stories.

Steps
--------
1. Fork this repo, and clone to your local machine
2. Run the command ```gem install bundle``` (if you don't have bundle already)
3. When the installation completes, run ```bundle```
4. Complete the above task:

Extra software and Gems used
-----------------------------

*Guard*

[To run Guard](https://github.com/guard/guard)

How the software currently works/looks:
------------------------------------

```
2.4.0 :001 > require './lib/airport'
 => true
2.4.0 :002 > require './lib/plane'
 => false
2.4.0 :003 > airport = Airport.new
 => #<Airport:0x007fed61906360 @capacity=70, @planes=[]>
2.4.0 :004 > plane = Plane.new
 => #<Plane:0x007fed628ea790>
2.4.0 :005 > plane = airport.land(plane)
 => "Plane has landed"
2.4.0 :006 > plane = airport.take_off(plane)
 => "Plane has taken off"
2.4.0 :007 > 70.times {airport.land Plane.new}
 => 70
2.4.0 :008 > airport
 => #<Airport:0x007fed61906360 @capacity=70, @planes=[#<Plane:0x007fed628cbed0>, #<Plane:0x007fed628cbe80>, #<Plane:0x007fed628cbe30>, #<Plane:0x007fed628cbde0>, #<Plane:0x007fed628cbd90>, #<Plane:0x007fed628cbd40>, #<Plane:0x007fed628cbcf0>, #<Plane:0x007fed628cbca0>......(70 times)> 
2.4.0 :009 > airport.land Plane.new
RuntimeError: Airport is at full capacity.
```

**Notes On Submission**

*Tasks completed/part completed:*
- Plane status - partly completed (not sure if in right order)
- Plane landing - partly completed (tried two different methods, current confirmation by string)
- Plane takeoff - partly completed (same as with "landing")
- Full airport cannot land planes - completed
- Variable and default capacity - completed

*Tasks remaining(with notes):*
- Storms prevent landing - Tried to test and implement twice but kept failing, removed from current code.
- Storms prevent takeoff - as above ^
- Errors raised for inconsistent actions - kept failing, removed from current code.

*Current code is at 100% coverage with only one rubocop offence, offence in Guard-gemfile (can't fix)*

*Solution references*
- None so far

Code review
------------
Submitted code reviewed against the following:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.
* Reviewed using this [code review rubric](docs/review.md).
* Code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.
