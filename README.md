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

This involved the creation of an airport simulator written in Ruby using TDD.

My approach was to first ensure all of the 5 user stores below were met, and then to defend against edge cases.

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
Assumptions
---------

* When created, an instance of a plane is always in the air (or flying). While this of course does not represent real life, the alternative of creating a grounded plane meant that in order for the rest of the program to work, it would have to be in an airport
* Because of the above, an instance of an airport will have no planes when created
* The requirement for weather states "it is normally sunny but on rare occasions it may be stormy", so I have assumed it will be stormy 20% of the time
* An instance of an airport has a weather forecast when created but this cannot be changed in the current code. Therefore an airport which is currently stormy can never have a plane land or take off

Progress
---------

My code stratifies all of the above user stories and does defend against edge cases. The tests however do fail on occasion because of the random weather conditions. I was not able to implement tests using test doubles to ensure consistent weather, and this would be the next and final stage in completing the task. As such, there are no unit tests regarding weather conditions, however the code does meet feature tests as demonstrated below;

```
$ irb
2.6.5 :021 > airport = Airport.new
 => #<Airport:0x00007fc70911a6c0 @weather=#<Weather:0x00007fc70911a698 @forecast="stormy">, @planes=[], @capacity=2>
2.6.5 :022 > airport.land(Plane.new)
Traceback (most recent call last):
        5: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/student/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):22
        1: from /Users/student/Documents/Projects/Week1/airport_challenge/lib/airport.rb:21:in `land'
RuntimeError (stormy weather - plane cannot land)
```
