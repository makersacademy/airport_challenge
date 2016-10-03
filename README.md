Airport Challenge [![Build Status](https://travis-ci.org/lauraweston/airport_challenge.svg?branch=master)](https://travis-ci.org/lauraweston/airport_challenge)
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

Solution
--------
Using Rspec and TDD principles, I modelled the solution with classes for Airport, Plane and Weather. All instance variables remain private since it is unnecessary for the other classes to have access to them. I approached each user story one at a time, testing edge cases where necessary (e.g. planes cannot land/take off if already landed/airborne; an airport should release a specific plane at take off; an airport can only instruct a plane to take off if the plane is at the airport).

**Assumptions:** Planes are airborne when initialized.

**Generating random weather:** ```srand(1)``` is used in weather_spec.rb to seed a sequence of repeatable pseudo-random numbers between 1 and 5 that could be reused with each run of the rspec tests. Number 5 was used to denote stormy weather; all other numbers denote sunny weather. Random weather is generated by ```#current_weather```, which is called before each plane lands or takes off.

**Further development:** I would consider assigning a Plane an airport status so that it knows which airport it is in when landed.

**Example of program in IRB:**  
```
2.2.3 :009 > weather = Weather.new  
 => #<Weather:0x007f944303e1c8>  
2.2.3 :010 > capacity = 3  
 => 3  
2.2.3 :011 > airport = Airport.new(weather, capacity)  
 => #<Airport:0x007f944489bbf8 @planes=[], @weather=#<Weather:0x007f944303e1c8>, @capacity=3>   
2.2.3 :012 > plane_1 = Plane.new  
 => #<Plane:0x007f9444892dc8 @landed=false>  
2.2.3 :013 > plane_2 = Plane.new  
 => #<Plane:0x007f94448835a8 @landed=false>  
2.2.3 :014 > plane_3 = Plane.new  
 => #<Plane:0x007f9444879a80 @landed=false>  
2.2.3 :015 > plane_4 = Plane.new  
 => #<Plane:0x007f9444869338 @landed=false>  
2.2.3 :016 > airport.land_plane(plane_1)  
 => [#<Plane:0x007f9444892dc8 @landed=true>]  
2.2.3 :017 > airport.land_plane(plane_2)  
RuntimeError: Plane cannot land in stormy weather!  
       	from /Users/lauraweston/code/makers/week-1/airport_challenge/lib/airport.rb:12:in `land_plane'  
       	from (irb):17  
       	from /Users/lauraweston/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'  
2.2.3 :018 > airport.land_plane(plane_3)  
 => [#<Plane:0x007f9444892dc8 @landed=true>, #<Plane:0x007f9444879a80 @landed=true>]  
2.2.3 :019 > airport.land_plane(plane_2)  
 => [#<Plane:0x007f9444892dc8 @landed=true>, #<Plane:0x007f9444879a80 @landed=true>, #<Plane:0x007f94448835a8 @landed=true>]  
2.2.3 :020 > airport.land_plane(plane_4)  
RuntimeError: Plane cannot land - airport is full!  
       	from /Users/lauraweston/code/makers/week-1/airport_challenge/lib/airport.rb:13:in `land_plane'  
       	from (irb):20  
       	from /Users/lauraweston/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'  
2.2.3 :021 > airport.take_off(plane_2)  
 => #<Plane:0x007f94448835a8 @landed=false>  
2.2.3 :022 > airport.land_plane(plane_4)  
 => [#<Plane:0x007f9444892dc8 @landed=true>, #<Plane:0x007f9444879a80 @landed=true>, #<Plane:0x007f9444869338 @landed=true>]  
2.2.3 :023 > airport.take_off(plane_3)  
 => #<Plane:0x007f9444879a80 @landed=false>  
2.2.3 :024 > airport.take_off(plane_1)  
 => #<Plane:0x007f9444892dc8 @landed=false>  
2.2.3 :025 > airport.take_off(plane_1)  
RuntimeError: The plane is not in the airport!  
       	from /Users/lauraweston/code/makers/week-1/airport_challenge/lib/airport.rb:20:in `take_off'  
       	from (irb):25  
       	from /Users/lauraweston/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'  
2.2.3 :026 > airport.land_plane(plane_4)  
RuntimeError: This plane has already landed!  
       	from /Users/lauraweston/code/makers/week-1/airport_challenge/lib/plane.rb:8:in `land'  
       	from /Users/lauraweston/code/makers/week-1/airport_challenge/lib/airport.rb:14:in `land_plane'  
       	from (irb):26  
       	from /Users/lauraweston/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'  
2.2.3 :027 > airport.take_off(plane_4)  
 => #<Plane:0x007f9444869338 @landed=false>
 ```
