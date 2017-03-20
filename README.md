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

## Introduction

Welcome to the most efficient airport. This is the air traffic controller speaking, and you are about to embark on an amazing journey in the hope to discover the world of Ruby.



Today's main destinations:

* Object oriented programming
* Test driven development
* From user stories to domain model
* Feature tests via command line
* Unit tests with RSpec tesing framework

Approach
---------

Here are the five steps that make me a successful air traffic controller.

1. **Extracing a Domain Model from User Stories:** I write down all the nouns (Objects) and verbs (Messages) from the user stories. The Messages describe how the objects within the system interact.
2. **Diagraming the Domain Model:** Objects and Messages are the cornerstones of the Object Oriented Programming. I draw them out and to I have a trustworthy guide throughout the entire journey.
3. **Feature test the interaction between the Objects:** Read-Eval-Print Loop (REPL) is my interactive friend which provides immediate feedback on whether my airport and planes are communicating properly. I recently upgraded my system with a customized *pry*.
4. **Write unit test to guard your code:** RSpec is where the whole magic happens. A Behaviour-Driven Development tool for Ruby, RSpec allows me to combine my domain driven design and test-driven development. It tells me each morning whether the airport is fully functional.
5. **Create and conquer:** Based on my unit tests, I can now build and improve my airport. Fix a red failing test by making it green and then refactor.    

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. See below for a sample pry output Note that you need to *require* the airport file in advance.

```
::: require './lib/airport.rb'
=> true
::: airport = Airport.new
=> #<Airport:0x007f8664cc5a28
 @capacity=100,
 @planes=[],
 @weather=#<Weather:0x007f8664cc59d8>>
::: plane = Plane.new
=> #<Plane:0x007f8664c7dc50 @landed=false>
::: airport.land(plane)
=> [#<Plane:0x007f8664c7dc50 @landed=true>]
::: airport.take_off(plane)
RuntimeError: Stormy weather. No planes flying.
from /Users/emil/Dropbox/Makers Academy/Projects/airport_challenge/lib/airport.rb:25:in `take_off'
::: airport.take_off(plane)
=> #<Plane:0x007f8664c7dc50 @landed=false>
::: airport.planes
=> []
::: plane.landed
=> false
::: quit
```
