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

Task
-----

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

User stories
-----

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

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
Edge cases
-----

```
Plane can only take off from airport it is in

Flying plane cannot take off and cannot be in airport

Plane that are landed cannot land again and must be in airport
```

## Interface
To run this program, users can use either `irb` or `pry`.

Files required to start the program:
```ruby
require './lib/airport.rb'
require './lib/plane.rb'
```

There is 25% chance of stormy weather:
```ruby
weather = Weather.new
weather.stormy?
=> false
```

To create a new plane:
```ruby
plane = Plane.new
```

User can specify airport capacity, otherwise it will be instantiated with default capacity of 20:
```ruby
airport = Airport.new
airport_other_capacity = Airport.new(200, weather)
```

Planes can be instructed to land, when weather is not stormy. An error is raised when airport has reached capacity:
```ruby
airport_default.instruct_landing(plane)
```

Planes can be instructed to take off when weather is not stormy. An error is raised when plane is another airport:
```ruby
airport.instruct_take_off(plane)
```

## Resources
- [Sam Morgan's tutorial](https://www.youtube.com/watch?v=Vg0cFVLH_EM): provided a massive input on organising user stories, along with helping me understand the use of ```RSpec``` mocks and syntax.
- [Former Makers Academy student, Tom Spencer's blog](https://medium.com/@tomspencer_uk/weekend-challenges-with-makers-academy-my-experience-with-the-airport-challenge-4e50ea848bb4)
- [Airport Challenge code review rubric](docs/review.md).
- [@vannio](https://github.com/vannio/challenge-airport-traffic/blob/master/README.md)'s repository for input on README structure.

## [Walkthrough](Walkthrough.md)
- Writing things down help me understand things much better. Hence I wrote down all the steps taken throughout the challenge (might be verbose and redundant)
