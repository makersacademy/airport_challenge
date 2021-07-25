Project Title - Airport Challenge (Makers)

Motivation
End of week 3 test to allow calibration of current learning status and allow setting of goals in future weeks.

Build status
v0.1 Submitted intial non working copy 23rd July 13:45 (got stuck with my setup of the classes
v0.2 Submitted updated working copy 25th July pm with updated readme.md and working tests and code.
v0.3 Submitted 25th July with Robocop completed and All tests passing coverage at 87.50% for plane class, and 94.74% for airport class. not refactored at this point.

Code style
Ruby, RSpec, rubocop.

Screenshots
not provided

Installation
lib folder required for plane.rb and Airport.rb
spec folder required for Airport_spec.rb and plane_spec.rb which are the RSpec tests.

Provide step by step series of examples and explanations about how to get a development env running. (to be provided)

API Reference
none

Tests

from airport folder, rspec spec/**specfilenamesto be inserted here**

How to use?

Currently not operational in itself, but passes RSPEC testing, and a command line interface could be written to handle operating the major functions.

Contribute

I'd love any feedback please. I still need to refactor the code, and run rubocop at this stage

Credits

I'm proud to say that i completed this myself, with the knowledge that my coach was there to help me if i really needed it. Thanks to Katerina Georgiou for helping me out of the starting blocks when i could not work out why GitHub was telling me i did not have permissions to fork the repo. It turned out i did, but what just looked like my name and git hub id was a link to for the repo (but did not explicitly say this). One of lifes funnier moments now! o:))

License

no known license requirements.

The challenge, my approach and thoughts are below:

Airport Challenge (updates below the provided introduction on how task approached and status)
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

ANALYSED user stories for nouns and verbs
_________________________________________

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
verbs = get, instruct, land
nouns = passengers, destination, plane, airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
verbs = get, instruct, take off, confirm
nouns = passengers, plane, aiport, 

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
verbs = ensure, prevent landing
nouns = safety, airport

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
verbs = used, overridden
nouns = software, airports, capacity.

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
verbs = ensure, prevent
nouns = takeoff, weather

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

verbs = ensure, prevent
nouns = landing, weather

Potential actions from analysis:
________________________________

air traffic controller  
    instructlanding_at_airport
    instruct_takeoff_from_airport
    
    confirm_leftairport
    prevent_landing_when_airportfull
    prevent_landing_when_stormy
    prevent_takeoff_when_stormy
system designer  
    override_default_capacity

Note: requirement for weather to be emulated - potentially in tests first.
INPUTS


EDGE CASES 
__________

no planes in airport
over capacity
instructs to land at a different airport (assuming this can also be valid, e.g. technical difficulty so not programming in)
** assuming things like landing at right airport not controlled at this point by the program but by ATC.
that planes can only take off from airports they are in
planes that are already flying cannot take off and/or be in an airport;
planes that are landed cannot land again and must be in an airport, etc
note: may need additional variables such as inflight status (flying, landed) and landed to monitor this.

Classes Needed and PSEUDO code
______________________________

Class Airport 
INPUTS
will need to define variables such as capacity and an array of planes with location
will need to assess if needed outside of class or not
METHODS
  instructlanding_at_airport
    call prevent landing when stormy then do not land if true, else land, set airport variable, , set landed/flying variable
  instruct_takeoff_from_airport
    check if stormy then do not take off. if takeoff, set airport variable, set  landed/flying variable
  #confirm_leftairport
    not required, as variable will be set to monitor this, e.g. flying / landed.
  prevent_landing_when_airportfull
    check if > capacity if plane lands and return message.
  prevent_landing_when_stormy - return true if stormy.
  prevent_takeoff_when_stormy - return true if stormy ** potential to merge with above method for landing
  instruct landing **not sure required. parking
OUTPUTS updated capacity, inflight (True / False), airportat

Class Weather *have done as a method of airport as required to be generated for each airport on demand. Just in case needs to be stored later.
  INPUTS number from 1-10, or default uses the rand(10) generation
  #, this could take an input argument to allow control during testing and eradicate random results impacting rspec testing.
  weather_is_stormy
    Returns stormy rarely, and OK otherwise. Potential to use rand(10) to generate this where 10 is Stormy (so 10 % currently). Return True if stormy
  OUTPUT TRUE / FALSE

  Key Learnings
  _____________

  Realised about half way through that struggled to control the plane information in an array, so created a Plane Class
  Plane Class
  Initialises last airport, assigned plane no, and status (flying, landed)
  It also returns this information on request, or the values can be directly updated.

  This brought some complexity in and i struggled to make the necessary changes to the rspec and code to make this operational.
  Initial thoughts:
   I believe that once i can get the airport class reading the people data consistently then i can make progress on finishing the task. It was the introduction of passing multiple variables that has hamstrung my progress in diagnosing the issue. Also should have regularly saved changes to show that all tests were working, so a lesson learnt going forwards.
  Thoughts at 25th Jul:
   I made real progress once i created a class variable @@array_of_planes. I struggled at times with using self.object_id just because you need to be clear when calling it what you are calling it on and so i was getting nil results in my tests due to this. Implementing checks for overriding capacity (by a class instance variable) was fairly straightforward as well as the checks for for takeoff and landing to ensure the plane is in the correct status. 
   
   Going forwads i need to create more programming muscle memory as time was taken and lost during writing the code to ensure the correct functions were called. The code as this point needs refactoring and rubocopping. Certainly learning how to use doubles and stubs will help with this. 
   
   Overall i'm really happy with the progress i've made on reworking the code and getting the tests to pass.  Another goal is to ensure i'm systematically checking the error messages and focussing on the issue at hand, again i now feel like the intervention i made to get the code to this working state is supportive of that goal and demonstrates wel my current level of understanding of Ruby and RSpec on a completely independant project.

   Running Rubocop was actually great, and it provided some great refactoring and tips on guard clauses. This has been run on both .rb files, but not aware at this point if it can be run on rspec files, i tried but it did not run. Although test coverage was lower on plane (87.50%, i had tested the second def statement). The test coverage was 99.03% on the airport.rb.

   Finally, i did not commit my small changes enough. I have promised myself to make this a goal and work on this in following weeks. A great habit would be to make commit at each test pass with rubocop performed.

   If you've got this far, thankyou so much!
