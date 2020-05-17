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

## Approach

### Design

Copy user stories into client_stories.txt

Identify the required object classes based on the stories,
Identify the required information that each of the objects would have
Identify the required methods they would need.
(the above is in the client_stories.txt)

Also i had a quick think about the possible argument that were needed,
but decided that as i would be creating the code these would change I didn't write them down

### TDD

The choice of the first test was based not just on the order of the objects identified,
but also I wanted one that would be one that the ATC operator would be actively interacting with.
Then the next Object Class to code would be one that interacted with the first the most.

#### Plane

Set up the basic tests of the Plane class
Pass the tests
Refactor the spec file and code file as needed

Note that as this was before i looked at Doubles the test used string for the airports

#### Airport

Set up the basic tests of the Airport class
Pass the tests
Refactor the spec file and code file as needed

Also done before checking out Doubles

#### Weather

Set up the basic tests of the Airport class
Pass the tests
Refactor the spec file and code file as needed

### Final Refactoring

Identify methods that were doing too much, creating new methods such that each filled the SRP in my opinion
Make all inward facing methods private
Double check with rubocop about any guideline violations, make those changes (including adding code to make it happy airport:49-50)

## Comment about Weather being so empty

I feel that as I identified at as weather wanted to not have much inside it (as the weather its self should be talking to the operator)
Though I am now slightly tempted to make a WeatherStation class, which would potential simplify the code in the Airport class.
