# Airport Challenge

[![Build Status](https://travis-ci.org/charlottebrf/airport_challenge.svg?branch=master)](https://travis-ci.org/charlottebrf/airport_challenge)

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

Technologies
-----

## Install

* Bundle install Gemfile dependencies

```bash
 $ bundle
 $ gem install bundle

```

* Ruby v '2.2.0'

```bash
$ rvm install 2.2.0
$ rvm use 2.2.0

```
Test coverage
-----
```
Test coverage: 100%
Rubocop: no offences
```

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


My Approach
-----
I took the following approach when solving the Airport Challenge:

- I started by drawing Domain Models for the User Stories
- **Tests & doubles**: When I began with just 2 classes I first wrote the code without doubles to have clarity on code. As the complexity increased when I added the Weather Station I then found value in doubles & refactored my tests.
- **Plane**: I then began with the Plane spec & class, I knew that I would need to decide the starting flight status of the plane. I decided planes would be initialized as flying.
- **Plane**: I added further taken_off?, landed? & flying? methods so I could check the flight status as a boolean condition against the Airport class which changes a plane's status depending on if they've landed or taken off.
- **Airport**: land & takeoff methods begin with if statements to only land or takeoff a plane under the correct conditions given in the user stories. They raise errors if planes can't land or takeoff. Separated out into two methods the conditions to not land or takeoff a plane.
- **Airport**: They also store the plane in landed_planes if successfully landed & delete them once they've taken off. We can check how many planes are present? in the airport.
- **Airport**: Aimed to separate out into methods as much as possible to ensure encapsulation.
- **Weather Station**: This was the most challenging part. Realising that rand method is an instance of Random class helped me to work out how to use this in the class & effectively in the doubles/ stubs. I then created a fake_station that would always be sunny & set my tests to expect sunny. Read my blog post [here](https://medium.com/@charlottebrf/makers-academy-day-5-8dc1c792cda5) about using mocks & doubles for the tests.
- **Airport**: Has a 'boutique' MAX_CAPACITY of 10, but can be overriden by controller to be a different number.

Future improvements
-----
- **Edge Cases**: Aimed to satisfy as many edge case tests as possible. However, wasn't 100% sure I had satisfied the edge case "that planes can only take off from airports they are in". Program could be improved by ensuring edge cases are satisfied.
