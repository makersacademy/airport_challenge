[![Build Status](https://travis-ci.org/JAstbury/airport_challenge.svg?branch=master)](https://travis-ci.org/JAstbury/airport_challenge) [![Coverage Status](https://coveralls.io/repos/github/makersacademy/airport_challenge/badge.svg)](https://coveralls.io/github/makersacademy/airport_challenge)

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


The Task
-----

Write the software to control the flow of planes at an airport according to a client’s specifications. Planes cannot take off or land in stormy conditions and the program must defend against edge cases so planes cannot take off from airports they aren’t in, planes cannot land when already landed, e.t.c

You can see the full brief and user stories [here](https://github.com/makersacademy/airport_challenge).

How to Use
-----

1. Clone the repo to your local machine
2. Run ‘bundle install'
3. Run IRB or Pry
4. Require './lib/airport'

Create a new airport:
```
airport1 = Airport.new
```
Create a new airport with a capacity of 10:
```
airport2 = Airport.new 10
```
Create a new plane:
```
plane1 = Plane.new
```
Land a plane:
```
airport1.land(plane1)
```


My Approach
-----
Initially when converting the user stories into a domain model, I assigned landing and take-off functionality to the plane. However, after completing the program and looking into the responsibilities of my classes, it became apparent that my planes were going above and beyond what they should be capable of.

Therefore, I restructured the program so that airports are now responsible for taking off and landing planes. Within the take-off method, a method is called to check conditions are fine to take-off, the take-off method is called on the plane, the plane is removed from the airport and a success message is printed at the end if all methods have been performed. I did consider separating out this method even more (into a “request landing” method and a “confirm landing” method) but was cautious about over-designing.

I also created a class called Weather and a method called stormy? which is called whenever an airport requests a plane to land or take-off:

```
def stormy?
  rand(10) > 7
end
```

This means that it will be too stormy to take-off or land 20% of the time. A new instance of the weather class is created with each new airport so the user never has to interact with it directly.
