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

----
The first weekend challenge for the **June '21 cohort** - Makers, London

----

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


We established 6 user stories:

----

**First User Story**
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

**Functional representation of User Story 1**


|        Objects | Messages      |
| :------------: |:-------------:|
| ATC            |               |
| Plane          | Instruction   |
| Airport        | Land          |

**Interactions:**

**Plane <-- Instruction --> Land --> Airport**

Allow for inconsistent states:

  1. Plane must be airborne

  2. Airport must be able to accept plane

```
2.6.5 :001 > require './lib/plane'
 => true 
2.6.5 :002 > require './lib/airport'
 => true 
2.6.5 :003 > plane = Plane.new
 => #<Plane:0x000000010580da58> 
2.6.5 :004 > airport = Airport.new
 => #<Airport:0x0000000105816630> 
2.6.5 :005 > plane.land(airport)
 => nil 
2.6.5 :006 > plane.airborne?
 => true 
2.6.5 :007 > airport.ready?
 => true 
2.6.5 :008 > 
```
----

**Second User Story**

```

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```


**Functional representation of User Story 2**

|        Objects | Messages      |
| :------------: |:-------------:|
| ATC            |               |
| Plane          | airborne?     |
| Airport        | take off      |

**Interactions:**

**Plane <-- Take Off --> Airborne --> true**

```
2.6.5 :003 > plane = Plane.new
 => #<Plane:0x000000011280d3e8> 
2.6.5 :004 > airport = Airport.new
 => #<Airport:0x000000011300df70> 
2.6.5 :005 > plane.take_off(airport)
 => "We have left the airport" 
2.6.5 :006 > plane.land(airport)
 => "We have landed" 
2.6.5 :007 > quit
```

----
**Third User Story**

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full
```

**Functional representation of User Story 3**

|        Objects | Messages      |
| :------------: |:-------------:|
| ATC            |               |
| Plane          | don't land    |
| Airport        | full?         |

**Interactions:**

**Airport <-- full? --> Plane --> don't land**

```
brettkarlson@Bretts-Air airport_challenge % rspec

Airport
  is expected to respond to #take_off
  is expected to respond to #land with 1 argument
  returns an airborne plane
  returns a landed plane
  raises error if airport full

Plane
  is expected to respond to #land with 1 argument
  is expected to respond to #take_off with 1 argument
  is expected to be airborne
  confirms it is no longer in the airport
  confirms it has landed

Finished in 0.00258 seconds (files took 0.09626 seconds to load)
10 examples, 0 failures


COVERAGE: 100.00% -- 53/53 lines in 4 files
```

----
**Fourth User Story**

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
**Functional representation of User Story 4**

|        Objects | Messages      |
| :------------: |:-------------:|
| designer       |override       |
| capacity        |          |

**Interactions:**

**capacity <-- designer --> override** 
```
2.6.5 :004 > airport = Airport.new 40
 => #<Airport:0x0000000151028b70 @capacity=40, @hangar=[]> 
2.6.5 :005 > airport = Airport.new 50
 => #<Airport:0x0000000151028f08 @capacity=50, @hangar=[]> 
2.6.5 :006 > airport = Airport.new 60
 => #<Airport:0x0000000141097ee0 @capacity=60, @hangar=[]> 
2.6.5 :007 > 
```

---
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
