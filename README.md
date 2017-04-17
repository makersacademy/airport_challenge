Airport
=======

```
        ______
        _\____\___
=  = ==(____JB____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

![Alt text](https://github.com/JessicaBarclay/fizzbuzz/blob/master/public/fizzbuzz.jpg "fizzbuzz")


Explained
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  


Here are the user stories that the program should consider:

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


### How to run...

```ruby
irb
require './lib/airport'
```

### From here you can create a docking station and use the 'Boris Bikes' program as you wish!

```ruby
airport = Airport.new # creates a new airport with a default capacity of 10
airport2 = Airport.new(100) # customise capacity when instantiating airport class
airport.land(Plane.new) # land planes in the airport, watch out for stormy weather!
airport.hangar # this will return the @hangar array containing the Plane objects
airport.takeoff # again watch out for bad weather conditions!
```
