Airport Challenge
=================

For this challenge, I began by creating a the Plane and Airport classes. Once done, 
I created a land method for my Airport Class that could take 1 argument. 
This solved User Story 1. 

For User Story 2, in order to allow a plane to take-off and know it is no longer in the 
airport, it seemed like the right time to introduce the ability to store planes in airport
instances. This required an instance variable @plane to be created. I allowed said plane to 
be set equal to the plane that is passed in to the land method. Only if a plane landed 
would it be able to take off i.e. a plane that was never landed could not be passed into my 
take_off method. Problem with this approach was my plane instance varaiable only remembered the 
last plane that was landed. So if 2 planes landed at an airport, the second one overrides the first. 

To fix this, i created part of the classes state so @planes could be tored in an array. 
Each plane added upon landing and removed upon take-off. Only planes in the airport array could take-off. 
Only planes that weren't already in the airport could land. I created it so that you could input any plane
and you would get an error message if that plane was not in the airport but you tried to get that plane to 
take_off. Also gave an error message if you tried to land a plane that was not in the airport array. 
I did this using private methods to meet Single Responsibility Principles. 
Edge cases taken care off here. 

For user story 3, to stop landing when airport is full, I simply added a fail/error message
in my land method that would not allow planes to land if the airport array had 20 planes in it.
This was therefore the case for all airport instances. 

For user story 4, I turned the idea of airport capacity into the classes state by creating
capacity as an instance variable that is set when initializing a new airport. I allowed capacity
to be set upon initializing an airport by taking an optional argument. If no argument provided upon 
airport set-up, capacity was set equal a DEFAULT_CAPACITY constant variable i had set equal to 20.
Changed my tests and code to use @capacity instead of value 20. 
Final part of this was to turn @capacity into an attr_accessor so that it could be overridden 
to a new capacity at any point. Carried out tests to ensure all the above worked as planned

I did not get to user story 5 or 6, but I presume i would have created a random number generator,
and based on the result used if statements to prevent planes landing or taking off in bad weather. 
Looks like i would have had to use modules/mix-ins to achieve this. 













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

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
