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

## Process

* Created a domain model from user stories.
Please see Miro board:  (https://miro.com/app/board/o9J_kux70qo=/)



| Step          | Expected failure during testing| how  to make it pass  |
| ---------------------------------------- |:--------------------------------:| -----:|
| Class airport                            | won't find class              | make class & link to test (airport.rb)|
| Airport responds to plane 'landing' method | won't respond - no method| make method 'landing' method |
| Plane object lands                       |return nil as nothing in 'landing' method | write Plane.new in 'landing' method|  
|" "                                       |name error as no Plane constant | make Plane class (plane.rb) & link to airport.rb|
|Plane object lands by taking a Plane instance as argument | error -no arguments given| give #'landing' 1 argument|
|Airport can store many planes             |#'landing' => the last given plane| create an array '@planes' & push plane arg into it |
|Airport responds to 'take_off' method with 1 arg     |no response - no method | create 'take_off' method|
|" "                                                  |wrong amount of arguments | add argument to #'take_off'
|Airport will delete plane from @planes array| # finds plane included in array | @planes.delete(plane) |
|Outputs message if plane is not in airport        | no message | add puts statement to #take_off |
|Weather condition: airport responds to 'stormy?' method | no method error| create #'stormy?' |
|Airport.stormy? will return true if weather is 'stormy?' | => nil | create @weather variable & conditional in #stormy?|
|Prevent landing if weather is 'stormy?'| no effect |connect #'stormy?'  to #'landing' with conditional |
|Prevent take_off if weather is 'stormy?'| no effect |connect #'stormy?'  to #'take_off' with conditional |
|Full: airport responds to 'full?' method |no response - no method | create method|
|An Airport instance will have an attribute of capacity set to a default| no attribute| set @capacity = capacity and create default |
|* 1. Prevents landing 'if' Full? | |√ but need to change to raise error |
|* 2.  prevents 'take_off' if Full?||√but need to change to raise error |
|* 3. planes that are already flying cannot land|||
|* 4. Planes that are landed cannot land again and must be in an airport||√|


To change:

* In relation to the user stories "As an air traffic controller, To ensure safety
I want to prevent takeoff/landing when weather is stormy/ full" I have ensured that the @ plane array which is storing the planes does not change. However it would be better to raise an error instead (see the table at the bottom 1 + 2). (I had a lot of difficulty with raising errors - it seemed to cause the rspec file to faill all the tests). 

* An error should also be raised for the edge cases (see table bottom 3 + 4)

* weather should be a class that returns a randomised output
    def get_weather
    ['sunny', 'cloudy', 'stormy'].sample
    end
* 1. test: for Weather class
* 2. test: for get_weather method
* 3. test for randomised output
* weather class needs to be incorporated into Airport class
* test to see if Weather.new will create an instance of weather
* test it works with 'stormy?' 'landing' & 'full' method
