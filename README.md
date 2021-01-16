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
This is my solution to the weekend airport challenge. I have satisfied the below user stories. Please see below for an irb test-drive.

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

I did this by test driving the creation of a set of classes/modules to satisfy all the above user stories. I used a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy) and a stub in the rspec to set the stormy? method to false. After I updated my code to use class variables to keep track of which planes were flying and landed regardless of the airport they were in or had taken off from, I had to add extra stubs for landed? and flying?.

I really enjoyed learning to use stub methods to set a variable that could be random. I think my code is elegant but I'm sure I'll be disabused of this notion in the code review! Refactoring each error message into a further method seemed like overkill but it makes it easier to understand and ensures that it abides by the SRP, and meant it was easier to debug when adding new features.

Unfortunately I couldn't get the travis build to work, but hopefully I'll learn how to do that soon!

```Ruby
$ irb
2.6.5 :001 > airport = Airport.new
 => #<Airport:0x00007fc197956810 @capacity=20, @planes=[], @weather=#<Weather:0x00007fc1979567c0>>
2.6.5 :002 > plane = Plane.new
 => #<Plane:0x00007fc19795ce40>
2.6.5 :003 > airport.land(plane)
 => [#<Plane:0x00007fc19795ce40>]
 2.6.5 :007 > airport.takeoff(plane)
 => [#<Plane:0x00007fc19795ce40>]
```
The code throws errors for things you wouldn't want to happen, like trying to land a plane that's already landed in any airport, trying to takeoff a plane that's not in the airport, and 
