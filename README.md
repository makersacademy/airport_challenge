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

Steps
-----

1. Clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`
4. The application can be run in IRB by doing `irb -r "./lib/airport.rb"`, followed by `require "./lib/plane.rb`

About
------

This is an application built using TDD/BDD that controls the flow of planes through airports. 

It includes a random generator for the weather, which can either be sunny or stormy. The majority of the time it is sunny, but stormy weather means that planes cannot take off or land. The weather is evaluated every time a plane is told to land or take off, and these actions are forbidden if the current weather is stormy. The functionality for this is stored in the `weather.rb` module, which has its own spec.

Planes are simple objects that can only tell when they are either flying/landed and their flight number. The airport is responsible for instructing planes to take off or land, as well as managing all of the planes in the airport.

Exceptions have been used to stop planes from being instructed to land when they are already landed and from being instructed to take off when they are either already flying or not in the airport. Exceptions were also used for handling the random weather.

Method stubs have been used to ensure that the weather is sunny for the majority of the tests, allowing tests to behave as expected. Tests have been included to make sure that the necessary exceptions have been raised.

A (rough) BDD approach has been taken, so the use of attribute readers and writers have been kept to a minimum - the airport class does not include any of these. The `feature_spec.rb` file includes tests written from a BDD perspective.

Each plane has a unique flight number, which is set on object instantiation. The planes are stored in an instance array on the airport as a hash, where the key is the flight number string and the value is the plane itself. 

Usage
-----

Creating objects:

```ruby
# creating an airport object
> airport = Airport.new(capacity)       # default capacity is 20, but this can be set here
=> #<Airport:0x000000012e9eb810 @capacity=20, @planes={}> 

# creating a plane object
> plane10 = Plane.new(10)               # an integer must be passed here, which is the unique flight number associated with each plane
=> #<Plane:0x000000012f8372e8 @flight_number=10, @flying=true> 
```

Managing planes:

```ruby
# landing a plane
> airport.land(plane10)

# checking what planes are at the airport
> airport.planes
=> ["Flight 10"]                        # note that only a string containing the flight number is shown here, rather than the plane objects state

# adding some more planes
> plane2 = Plane.new(2)
> plane3 = Plane.new(3)
> plane4 = Plane.new(4)

> airport.land(plane2)
> airport.land(plane3)
> airport.land(plane4)

# checking what planes are at the airport
> airport.planes
=> ["Flight 10", "Flight 2", "Flight 3", "Flight 4"]

# instructing a plane to take off
> airport.take_off("Flight 10")         # A string for the flight number is passed, so the actual plane object doesn't have to be passed
=> #<Plane:0x000000012f8372e8 @flight_number=10, @flying=true> 

# Checking the planes at the airport
> airport.planes
=> ["Flight 2", "Flight 3", "Flight 4"]

# Checking the status of the plane that took off
> plane10.status
=> "Flying"                             # returns a string for what the plane is currently doing, rather than object state
```

Comments
----

- In retrospect, I would probably change how the planes are stored; storing as a hash with the key set to the flight number could cause issues if multiple planes with the same flight number are landed using the current implementation
- Using the actual flight number, rather than a string, as the argument for taking off would be more intuitive and straight forward
- Considering BDD from earlier in the project would have saved time refactoring the project later on
- I think the way that I have set the weather in the specs is probably not the best way of doing it, although I'm unsure how else to do it!
