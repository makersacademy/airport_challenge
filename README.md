Airport Challenge - Makers Academy Weekend Challenge 1
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

## Using this program

This challenge was set as our first independent weekend challenge at Makers Academy. It allowed me to practice interpreting user stories into code using test driven development practices practiced using pair programming in the week. This challenge allowed me to test and build upon my ruby skills and become more comfortable with OOP, SRP and encapsulation.

```
irb
require './lib/airport.rb'
airport = Airport.new
plane = Plane.new
airport.land(plane)
plane.landed?
airport.take_off(plane)

```


## What I learned from this challenge
* How to use stubs in my tests
* Defending against edge cases
* OOP and Encapsulation
* Further practice with TDD and Rspec
