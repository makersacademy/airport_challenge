Airport Challenge 🛫
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

Task
-----

The airport challenge is a solo task to test drive a set of classes and methods in Rspec that satisfies the user stories outline below: 

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

My process
-----

I began by copying the user stories into a Word doc and highlighting the relevant nouns and verbs. I then decided on the following classes and methods:

Class | Methods
------------ | -------------
Airport | land, takeoff, prevent_landing, prevent_takeoff, full?
Plane | 
Weather | conditions


I was able to write 4 passing tests, satisfying the first 4 user stories. The code has 100% coverage and no offenses in RuboCop.

Unfortunately, I encountered blockers on the 5th and 6th user stories and was unable to complete them by the deadline. The approach I wanted to take was to have a 'Weather' class with a method called 'conditions', which would randomise between 'sunny' and 'stormy'. I would then add to the already created 'prevent_landing' method in Airport a line which would raise "Unable to land, weather conditions too dangerous" if conditions were stormy. I would have also created a 'prevent_takeoff' method, which would do the exact same thing in the opposite way, raising "Unable to take off, weather conditions too dangerous" if conditions were stormy.