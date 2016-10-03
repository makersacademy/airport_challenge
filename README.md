
OBJECT	                    MESSAGE
+ Air traffic controller
+ Pilot
As an air traffic controller, So I can get passengers to a destination 
I want to instruct a plane to land at an airport and confirm that it has landed
Airport	                    Instr!: Land at airport!
Plane                       Action!: land at airport!
Airport	                    Qry?: Has plane landed?

As an air traffic controller, So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport	
Airport 	                Instr!: Take-off from airport!
Plane                       Action!: Take-off from airport!
Airport	                    Qry?: Has plane taken-off?

As an air traffic controller, To ensure safety, I want to prevent landing when weather is stormy
For overriding random weather behaviour, use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.
You'll need to use a stub to override random weather to ensure consistent test behaviour.
Airport	                    Qry?: Is weather stormy? Random function to determine this.
Airport	                    Instr!: Don't allow take-off if it's stormy!
Plane                       Action!: Don't take-off as it's stormy!
~~~
Airport	                    Qry?: Is weather stormy? Random function to determine this.
Airport	                    Instr!: Don't allow landing if stormy!
Plane	                    Action!: Don't land as it's stormy!

As an air traffic controller, To ensure safety, I want to prevent landing when the airport is full 	
Airport	                    Qry?: Airport full?
Airport	                    Instr!: Don't allow landing if full!
Plane                       Action!: Don't land as airport is full!
	
Airport	                    Instr!: Set default airport capacity!

defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) 
such as inconsistent states of the system ensuring that planes can only take off from airports they are in; 
planes that are already flying cannot takes off and/or be in an airport; 
planes that are landed cannot land again and must be in an airport, etc.

NOTES:
I used the boris-bikes code to help me through this!

Bad weather has a 70% chance of occurring. The random function to determine this is in "weather.rb"
The weather call is made each time a plane takes off or lands so that 
the take-off or landing can be aborted if the weather is bad.

PROGRAM WORKINGS AND COMMANDS:
airport = Airport.new
land at airport = "airport.land_plane(plane)"
take-off from airport = "airport.take_off(plane)". The parameter "plane" is optional for a take-off. If it is not
supplied, then the first plane in the airport's planes array will "take-off".
Allow/prevent landing/take-off (due to bad weather) is determined by random value (true or false) returned 
to "airport.airport_open?"
This random value is determined by a function called "weather_forecaster" in "weather.rb".
The function "airport.airport_open?" calls the randomized weather determiner.
"airport.airport_open?" is itself called by both "airport.land_plane(plane)" and "airport.take_off(plane)", 
i.e. landing and taking-off do not necessarily use the same weather.
Use "airport.runway_open" to check if the airport weather has determined that the airport is open (status of airport).
If the plane is prevented from landing because of the randomly generated bad weather, 
the plane will not be entered into the array of planes at the airport.
If the plane is prevented from taking-off because of the randomly generated bad weather, 
the plane will not be removed from the the array of planes at the airport.
A plane cannot land if it has already landed.
A plane cannot take-off if it has already taken off.
A new airport can be initialized with a capacity of x (airport = Airport.new(10))but if no value is entered 
the default capacity of the airport is set to 20.
The plane is given a status of "down" when it lands and "up" when it takes off by the airport.
I chose not to initialize a plane with a status. The plane only gets a status when it lands or takes off.


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Airport Challenge
=================

```
         ______
         _\____\___
=   = ==(____MA____)
           \_____\___________________,-~~~~~~~`-.._         m          m   (birds)
           /     o o o o o o o o o o o o o o o o  |\_
           `~-.__       __..----..__                  )           =
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
