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

1. `gem install bundle` (if you don't have bundle already)
2. `bundle`



## Airport

In these corona times, many airports decided to upgrade their decades old software with new shiny technology.
They called me, and over a series of ~~zoom~~ google meet calls, these are the user stories I was tasked to accomplish



### User Stories:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

This is a good exaple on how to break down the user story into simple objects and actions:
```
-----
OBJECT                  ACTION
controller/user
airport                 land


(?)
plane
passengers
destination

```


One should do the same with the other stories too:

```
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

### Letting the tests drive you
Airports are a serious business, so we have to make sure that they are safe, and how best to do so, but to have some solid tests.

For each OBJECT and ACTION described in the above user stories, I created first a test, and then tried to fullfill it from the code.


## WHAT IS THE SIMPLEST THING YOU CAN DO

has been the motto today, so I tried to follow this point.
I think in terms of code buildup I did alright, but my tests still look a bit convoluted.

But, the back and forth, creating different tests and then code brought all the planes home (or away).


### A few interesting snippets of code:

define
```
subject { Airport.new(capacity) }
let(:capacity) { 1 } # default capacity
```
```

let(:capacity) { 2 } # dynamic capacity, to be put only when capcity needs changed
```

stubbing: making unpredictable behaviour predictable for testing sake
```
allow(subject).to receive(:stormy?).and_return(false)
```

check if method exists
```
 is_expected.to respond_to :stormy?
 ```
 and the more complicated sibling:
 ```
 is_expected.to respond_to(:land).with(1).argument

 # also explicitly:
 # expect(subject).to respond_to(:land).with(1).argument
 ```

 and finally, throw me an error:

```
 expect { subject.land }.to raise_error(RuntimeError, "Cannot land, it's stormy")
```


______________


## finished

That's it airports are now ready to accept endless passangers again


























Makers Instructions
---------

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

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
