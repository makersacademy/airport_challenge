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


As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

```
airport = Airport.new
plane = Plane.new
airport.land(plane) # Should do airport.push(plane)
```

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

```
airport = Airport.new
plane = Plane.new
airport.take_off # Should do airport.pop and return a confirmation
```

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

```
airport.land(plane) # Throw error if full?
```

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

```
airport = Airport.new(50) # should create an airport with capacity 50
```

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

```
# Create a method storm? to return true randomly
airport.take_off # throw error if storm?
```

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
airport.land(Plane) # throw error if storm?
```

All **RSpec** tests been written to drive the creation of a set of classes/modules to satisfy all the above user stories. For weather conditions a random number generator to set the weather been used (it is normally sunny but on rare occasions it may be stormy). In tests, a #stub method been used to override random weather to ensure consistent test behaviour.

Code written to defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.
