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

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

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

Domain model
------

Based on these user stories and further consideration I came up with the following Domain Model.

Objects  | Messages
------------- | -------------
Plane  |
Weather  |
Airport  | land
Airport  | takeoff
Traffic Controller  | instruct_takeoff
Traffic Controller  | instruct_landing

Programme structure
------
**Classes and brief explanation of how to use them.**

**Plane**
Class "Plane" is created to store an instance of the plane type. Each plane as store a status representing whether they are currently flying or not. Bu default the status is true. Status can be accessed and changed from the outside of the class.

```
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007faf5a9cedc8 @status=true>
[4] pry(main)> plane.status
=> true
[5] pry(main)> plane.status = false
=> false
[6] pry(main)> plane
=> #<Plane:0x007faf5a9cedc8 @status=false>
[7] pry(main)> plane = Plane.new(true)
=> #<Plane:0x007faf5c061ab8 @status=true>
[8] pry(main)> plane = Plane.new(false)
=> #<Plane:0x007faf5c03b048 @status=false>
[9] pry(main)> plane.status
=> false
```

**Airport**
Class "Airport" represents a one airport entity. Airport has two attributes: planes - an array that stores all planes that are currently in the airport, and capacity - representing the maximum possible number of planes. Capacity can be changed while instance creation, and equals to CAPACITY constant by default, which is now 10.
"Airport" has two public and two private methods.
* *land* - lands the plane. First it checks whether the airport is full, and if not it adds a new plane to "planes" array. If it is full it raises an error. It was important to raise this error (exceeding airport capacity) in this class in case if this function will be used later, to avoid nonsense situations.
* *takeoff* - takeoff the plane. First it checks whether this plane is already parked in this airport (part of "planes" array), and raises an error otherwise. If airport is empty there obviously no the plane we want to takeoff in the array so there is no need to check for it separately.
* *airport_full?* - checks if number of planes in "plane" array reached capacity
* *plane_in_airport?* - takes a plane as a parameter and checks whether it is already in the airport (part of "planes" array)

```
[10] pry(main)> port = Airport.new
=> #<Airport:0x007faf5a863d80 @capacity=10, @planes=[]>
[11] pry(main)> port = Airport.new(3)
=> #<Airport:0x007faf5c2ba0d0 @capacity=3, @planes=[]>
[12] pry(main)> plane1 = Plane.new
=> #<Plane:0x007faf5c2416d0 @status=true>
[13] pry(main)> plane2 = Plane.new
=> #<Plane:0x007faf5aa562c8 @status=true>
[14] pry(main)> port.land(plane1)
=> [#<Plane:0x007faf5c2416d0 @status=true>]
[15] pry(main)> port
=> #<Airport:0x007faf5c2ba0d0
 @capacity=3,
 @planes=[#<Plane:0x007faf5c2416d0 @status=true>]>
[16] pry(main)> port.land(plane2)
=> [#<Plane:0x007faf5c2416d0 @status=true>,
 #<Plane:0x007faf5aa562c8 @status=true>]
[17] pry(main)> port
=> #<Airport:0x007faf5c2ba0d0
 @capacity=3,
 @planes=
  [#<Plane:0x007faf5c2416d0 @status=true>,
   #<Plane:0x007faf5aa562c8 @status=true>]>
[18] pry(main)> port.land(Plane.new)
=> [#<Plane:0x007faf5c2416d0 @status=true>,
 #<Plane:0x007faf5aa562c8 @status=true>,
 #<Plane:0x007faf5c193a08 @status=true>]
[19] pry(main)> port.land(Plane.new)
RuntimeError: The airport is full
from /Users/KateLoschinina/Workspace/MakersAcademy/airport_challenge/lib/airport.rb:25:in `airport_full?'
[20] pry(main)> port.takeoff(Plane.new)
RuntimeError: There is no such plane in the airport
from /Users/KateLoschinina/Workspace/MakersAcademy/airport_challenge/lib/airport.rb:29:in `plane_in_airport?'
[21] pry(main)> port.takeoff(plane1)
=> #<Plane:0x007faf5c2416d0 @status=true>
[22] pry(main)> port
=> #<Airport:0x007faf5c2ba0d0
 @capacity=3,
 @planes=
  [#<Plane:0x007faf5aa562c8 @status=true>,
   #<Plane:0x007faf5c193a08 @status=true>]>
[23] pry(main)> port.takeoff(plane2)
=> #<Plane:0x007faf5aa562c8 @status=true>
[24] pry(main)> port
=> #<Airport:0x007faf5c2ba0d0
 @capacity=3,
 @planes=[#<Plane:0x007faf5c193a08 @status=true>]>
```

**Weather**
Class "Weather" is a simple class that doesn't have any methods, but just two attributes:
* *Stormy* - while initialization it get a *true* value if random is less than indicator, and false otherwise. Meaning that it returns whether weather conditions are stormy or not.
* *Indicator* - indicates which weather conditions we would assume as unacceptable (random variable is less than this parameter). By default equals to STORM_INDICATOR, which is set to 0.15, but can be changed during the creation of a class instance.

```
[25] pry(main)> strorm = Weather.new
=> #<Weather:0x007faf5b097178 @indicator=0.15, @stormy=false>
[26] pry(main)> strorm = Weather.new(0.7)
=> #<Weather:0x007faf5a8716b0 @indicator=0.7, @stormy=true>
[27] pry(main)> c = 0
=> 0
[28] pry(main)> 100.times {c += 1 if Weather.new.stormy}
=> 100
[29] pry(main)> c
=> 18
```

**Traffic Controller**
"Controller" is the main class of the group that has two methods:
* *instruct_takeoff* - Takes a plane and an airport as parameters, and has optional parameter weather, which is by default assigned to Weather.new - creating a random identification of whether it is stormy or not. The method goes through couple of scenarios: it raises an error if the plane is already flying; then it checks weather conditions, and if the conditions allow, it releases a plane with takeoff function of airport class (that checks that plane is part of the airport pool). If the plane took off, then its status is changed to true.
* *instruct_landing* - Takes a plane and an airport as parameters, and has optional parameter weather, which is by default assigned to Weather.new - creating a random identification of whether it is stormy or not. The method goes through couple of scenarios: it raises an error if the plane is already landed; then it checks weather conditions, and if the conditions allow, it allows a plane to land with function of airport class (that checks that airport capacity allows another plane to land). If the plane landed, then its status is changed to false.

```
[1] pry(main)> require './lib/traffic_controller.rb'
=> true
[2] pry(main)> cont = Controller.new
=> #<Controller:0x007fe70312e318>
[3] pry(main)> plane1 = Plane.new
=> #<Plane:0x007fe702992708 @status=true>
[4] pry(main)> plane2 = Plane.new
=> #<Plane:0x007fe703888b90 @status=true>
[5] pry(main)> plane3 = Plane.new
=> #<Plane:0x007fe702941808 @status=true>
[7] pry(main)> port = Airport.new(3)
=> #<Airport:0x007fe7021b9450 @capacity=3, @planes=[]>
[8] pry(main)> cont.instruct_takeoff(plane1,port)
RuntimeError: The plane is already flying
from /Users/KateLoschinina/Workspace/MakersAcademy/airport_challenge/lib/traffic_controller.rb:10:in `instruct_takeoff'
[9] pry(main)> cont.instruct_landing(plane1,port)
=> true
[10] pry(main)> cont.instruct_landing(plane1,port)
RuntimeError: The plane has already landed
from /Users/KateLoschinina/Workspace/MakersAcademy/airport_challenge/lib/traffic_controller.rb:23:in `instruct_landing'
[11] pry(main)> cont.instruct_landing(plane2,port)
=> true
[12] pry(main)> cont.instruct_landing(plane3,port)
=> true
[13] pry(main)> cont.instruct_landing(Plane.new,port)
RuntimeError: Due to adverse weather conditions an airpot is closed for landing
from /Users/KateLoschinina/Workspace/MakersAcademy/airport_challenge/lib/traffic_controller.rb:25:in `instruct_landing'
[14] pry(main)> cont.instruct_landing(Plane.new,port)
RuntimeError: The airport is full
from /Users/KateLoschinina/Workspace/MakersAcademy/airport_challenge/lib/airport.rb:25:in `airport_full?'
[15] pry(main)> cont.instruct_takeoff(plane1,port)
=> true
[16] pry(main)> port
=> #<Airport:0x007fe7021b9450
 @capacity=3,
 @planes=
  [#<Plane:0x007fe703888b90 @status=false>,
   #<Plane:0x007fe702941808 @status=false>]>
[17] pry(main)> plane1
=> #<Plane:0x007fe702992708 @status=true>
```

**NOTES**
Please note that although it seems like the programme has less methods than originally requested, all the functionality is covered:
* *I want to instruct a plane to land at an airport and confirm that it has landed* - Controller class, method instruct_landing
* *I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport* - Controller class, method instruct_takeoff
* *I want to prevent takeoff when weather is stormy* - Controller class, method instruct_takeoff
* *I want to prevent landing when weather is stormy* - Controller class, method instruct_landing
* *I want to prevent landing when the airport is full* - realised in Airport class, with error raised in land function
* *I would like a default airport capacity that can be overridden as appropriate* - realised in Airport class, capacity can be overridden during the creation of an instance

Instructions
---------
*Just for the reference below you can find the original instructions*

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
I want to instruct a plane to land at an airport and confirm that it has landed

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
