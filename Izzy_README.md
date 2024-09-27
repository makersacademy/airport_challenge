# Airport Challenge

## My approach

Please see original README.md to see the steps outlined in this challenge.

### User Story 1 and 2

**Instruct the plane to land at and take off from the airport**

* I ran a couple of feature tests to figure out what methods I would want to be calling from which class. Initially I ran the tests in the Plane class but soon
figured out that I wanted to send a message to the Airport class because that had the responsibility of cataloging the planes.
* I went through the red-green-refactor process until I was happy with the tests and methods to land a plane and instruct it to take off.

### User Story 3 and 4

**Prevent plane landing when airport is full and set a default capacity that can be overridden as appropriate**

* Again I went through the feature tests and wrote test to check if one cuold access a default capacity and then set a default capacity.
* The first step was to set an instance variable that allowed there to be more than one plane (@planes = []).
* I then added a constant DEFAULT_CAPACITY, before setting another instance variable @capacity. 
* I went through the red green process a few times to figure out what it was I wanted my code to do until I passed all the tests.

### User Story 5 and 6

**Prevent plane from landing and taking off when the weather is stormy**

* Started by adding a Weather class and spec. Ran a feature test to figure out what it was I wanted from this class. I wanted it to randomly generate weather
conditions.
* I wrote a test to check for random numbers and a method to match it.
* I then set up a constant to assign the numbers to weather conditions and another method to account for that. I wrote a test with a stub to check whether it would return a value from the CONDITIONS constant.
* With the weather tests and code passing, I wrote a test for the airport to check whether a plane would take off if it was stormy. I watched a lot of my other tests fail.
I figured out how use 'before' and 'allow' to set conditions for tests to work upon. 
* Went through green-red-refactor a few times until all the tests passed.
* Finally, I added a few more tests to account for edge cases.
