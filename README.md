# Airport Challenge
=================

### Description

An Object-Oriented approach to controlling the departure(s) and arrival(s) of
planes at an airport. The planes can take off and land, providing good weather conditions.

Consider edge cases, such as stopping planes that are already in the air from
taking off, or not allowing any planes to land when the airport is at full capacity.

### Development Process

* Clear user stories were defined to build the basic features of this programme. Using Domain models, I developed a quick idea of how to separate the nouns and verbs into objects and messages, and then to classes and methods.

* The temptation to start building application code is very high at this point, but by using irb to build feature tests, you can carefully construct unit tests with RSpec that can validate your application code, piece by piece.

* The first complexity came with the introduction of randomised weather, and after playing around in irb, I realised that I wanted to re-think my domain models.

* I researched HEAVILY around stubbing doubles in RSpec before I grasped the idea that weather can be a separate class and then initialized on an instance of airport. This concept that every interaction could occur within the airport.rb file allowed me to keep the other objects simple by comparison e.g. the plane object would only have an instance variable of status that toggled between being 'Airborne' or 'Grounded', depending on whether it had landed or taken off. Similarly, weather would only need to sample on an array where 'Stormy' conditions have a 1 in 5 chance of occurring.

* Once this structure was in place, it became easier to manage edge cases, such as making sure a place could not take off if it was already flying.

### Install and Execution

Install Bundler and the relevant gems with the below commands:

`gem bundle install`

`bundle`

To run the programme, use the below command in irb:

`require './lib/airport.rb'`

### Author

Terence Allitt

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
