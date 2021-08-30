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


First User Story to work on:

"As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport"

- The objects of this story are "plane" and "airport", while "land is the message for the airport object.
- In IRB, tried to create a new object of the Airport class ans assign it to a variable "airport"
- "uninitialized constant Airport (NameError)" in return, since we have not created an Airport class yet
- created Rspec file in the spec directory, created an initial failing test for the Airport class
- "uninitialized constant Airport" error now, we are getting an error outside of the examples because the file airport.rb with the Airport class doesn't exist yet and it has also not been required within the airport_spec.rb file
- created "lib" directory, created airport.rb with the Airport class, required "airport" in the spec file, ran rspec again
- test is passing now, in IRB I am now able to create an object of the Airport class
- testing landing feature in IRB, it airport fails to land a plane since there is no method created
- added failing unit test for land_plane method
- added method in airport.rb, test is now passing
- refactor to have it respond to land_plane with one argument
- One plane can now land at an airport, first user story completed

"As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport"

- In IRB I can't use a take_off method
- introducing failing test to see if Airport.new responds to take_off
- adding take_off method to airport.rb, it returns "nil" at the moment
- as a traffic controller, I want to confirm that the plane is no longer in the airport, I need to change the value of :plane after the take_off. Now I'm using only 1 plane as total capacity, so changing @plane to nil should do (take_off does not require any argument at the moment)

"As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full"

- Before checking if the airport is full or not, I want to change my instance variable @plane to an array in order to store multiple plane. This requires a bit of refactoring in the code and in the spec files
- tested in IRB, @planes stores multiple objects and is able to delete single items after each take_off
- now I can store multiple objects within @planes, I can start working on the capacity
- the feature fails in IRB because at the moment I don't have a limit on the capacity, so @planes will never be full
- introducing new failing unit test to raise error if new plane tries to land when capacity is reached (magic number 20 for now)
- added "fail" within #land method to raise an error if new plane tries to land when 20 planes are already on the ground
- refactored the code to align with Single Responsibility Principle for the #land method, introduced private #full? method

"As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate"

- replaced Magic Number with a DEFAULT_CAPACITY constant that can be changed as appropriate (wonder if I should be using an attr_accessor for @capacity here to enable the same airport to change capacity as well if needed, the feature as it is right now seems more something established at the beginning for each airport that shouldn't be changed, attr_accessor seems more flexible)

"As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy"

- added new spec file for weather, created new Weather class
- introduced new failing unit test to see if #sunny method returns true
- adjusted the #sunny method to return true 4 times out of 5
- introduced new failing unit tests that check for errors in case weather is not sunny (no landing or takeoff permitted)
- test were working as expected, but when writing the code I realised I wasn't able to call the method just created for the Weather class from the Airport class (it really does make sense once you think about it)
- after a bit of research, I realised that I can instantiate weather as an attribute of airport (the ariport will only ever need 1 weather object, and the state of weather can change based on the method #sunny? created for that class)
- after implementing the code, went back to run the units test and to my surprise they were still failing. I wasn't using doubles very well apparently, so I had to make some adjustments to create doubles for the attributes for Airport and tried several combination before having green tests and move to the next step

"As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy"

- this followed the same approach of the previous user story, with all the steps already defined this time it was much quicker to create a failing unit test and then write the code to make it pass

All the user stories have been covered now, it's time to move to edge cases

- added new test to expect an error if we try to take-off when there are no planes stored, test is failing as designed
- introduced new method in the code to check if the planes Array is empty and raise an error if #take_off is called when no planes are available. Test is now passing, good in IRB as well

- I want to prevent a plane that is already landed to land again. Tried in IRB, at the moment the code allows the user to add the same plane multiple times in the array.
- Added a failing unit test that should raise an error if a plane that is already in the array tries to land again
- Test is now passing, but I would like to improve this to include something to change the status of @flying on the Plane instance

- Now trying to see if I can check/establish if a plane is flying or not, so that I can return an error in case a plane that is not flying (meaning already in the @planes array) tries to land or if a plane that is already flying tries to take-off
- Tried in IRB, obviosuly there is no attribute for a Plane Object right now to estabilish if it's flying or now, so IRB doesn't return any error as expected.
- Created failing unit test, in order to fix it I need to make changes in the Plane class to initialize an attribute @flying, so I'm also adding an argument to the Plane object (should be just a Boolean true/false) and an attr_reader for that attribute (not adding it as an attr_accessor as I think I will modify the value via some other method). Now the unit test in plane_spec.rb is green
- This is were I stop for now, I would love to come back and complete the final tasks for this project in the future!