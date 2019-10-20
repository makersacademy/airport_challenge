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

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

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

# My approach to Solving this challenge.

## Airport Class

###### The initialize method sets up some important parameters:

```
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @stormy = rand(10)
    @full = false
    @capacity = capacity
    @airport_id = object_id
  end
```

Each instance will have a capacity of 40 by default, as well as a 30% chance of stormy weather.

Passing in a value for capacity on the creation of new instances will override this value.

###### Each instance can recieve planes as they land.

```
Heathrow = Airport.new(capacity = 100)
boeing_747 = Plane.new

Heathrow.receive(boeing_747)

puts Heathrow.hangar # => [boeing_747]
```

Upon landing, planes are stored in a hangar, here represented by an array. The status of each plane (What airport is it in? Is it flying?) is appropriately changed.

Planes will not be permitted to land if the weather is stormy or if the hangar is over capacity. It is also not permitted to receive a plane that is already in the hangar.

###### Each instance can allow planes to take off

```
Heathrow.allow_take_off(boeing_747)

puts Heathrow.hangar # => []
puts boeing_747.flying # => true
puts boeing_747.airport # => ""
```

If the weather is not stormy, planes can leave the airport. When a plane leaves the airport any referneces to it being in the hangar are removed. The planes flying status will set to true and its aiport attribute will be an empty string.

Planes are not permitted to take off if the weather is stormy. It is not possible to take off from an airport in which that plane is not stored in and no plane can take off if it is already flying.


