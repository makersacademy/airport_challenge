Description:
-----------

We are building a system to control the flow of planes at an airport. Our system will allow planes to land and take off from the designated airport. Our system will keep track of the number of planes at each airport. Occasionally airports will be full - planes will not be permitted to land if the airport if full. Planes will only be allowed to take off if the weather is sunny; when the weather is stormy planes will be prevented from taking off.



# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land



User stories:
------------
```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing when the weather is stormy
```

Your task is to test drive the creation a set of classes/modules to satisfy all the above user stories. You will need to use random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour. Finally, every plane must have a status indicating whether it's flying or landed. 

The existing tests in the spec folder, and base classes in the lib folder are provided merely as a general guide.  Please create more classes, unit and/or feature tests as appropriate.  The existing specs provide the layout of a set of pending unit tests, and a pending 'grand finale' feature test that combines a number of features. It is up to you to implement the tests and create additional tests as necessary.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

As mentioned above the existing tests are there just for the inspiration if you need it. You don’t have to implement every single test there and you aren’t limited by the tests there either. Feel free to modify the tests as you see fit.

Please create separate files for every class, module and test suite. 

The submission will be judged on the following criteria:

* Tests pass
* Tests coverage is good
* The code is elegant: every class has a clear responsibility, methods are short etc.

Note that is a practice 'Tech Test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first. 



What I did:

* First I put pen to paper to break down the problem into smaller parts to make it easier to understand - constructed basic domain model
* Class-responsibility-collaboration cards for Plane and Airport classes to help organise in my mind



On top of the card, the class name
On the left, the responsibilities of the class
On the right, collaborators (other classes) with which this class interacts to fulfill its responsibilities

Check the following:
Tests pass
Tests coverage is good
The code is elegant: every class has a clear responsibility, methods are short etc.


QUESTIONS TO ASK YOURSELF:

Has it matched the specification?
Is it clean code?
CI - Has it passed Continuous Integration
OOD - How well-designed is it?
OOP - Are your objects SOLID?
TDD - How well tested is it?
MVC - Have you understood how to build an MVC app properly?
DRY
KISS
You Aren't Gonna Need It
Principle of Least Astonishment
