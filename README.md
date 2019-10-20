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


## Usage:

Each Airport instance will have a capacity of 40 by default, as well as a 30% chance of stormy weather.
Passing in a value for capacity on the creation of new Airport instances will override this value.

Planes can land and take off from airports allowing for Airport capacity and weather conditions
```
require_relative 'airport'
require_relative 'plane'

# Create objects
Heathrow = Airport.new(100)
boeing_747 = Plane.new
boeing_737 = Plane.new

# Get flying status
puts boeing_747.flying # => true

boeing_737.land(Heathrow)
boeing_747.land(Heathrow)
puts boeing_747.airport # => <airport ID>

puts Heathrow.hangar # => <Plane:0x00007fc738826890> , <Plane:0x00007fc738826840>
puts boeing_747.flying # => false

boeing_747.land(Heathrow) # => Plane already in airport! (RuntimeError)

Heathrow.allow_take_off(boeing_737)
puts Heathrow.hangar # => <Plane:0x00007fc738826890>
puts Heathrow.stormy? # => true or false

```

Upon landing, planes are stored in a hangar, here represented by an array. The status of each plane (What airport is it in? Is it flying?) is appropriately changed to reflect the airport ID of the airport it is stored in and whether it is flying or not.

Planes will not be permitted to land if the weather is stormy or if the hangar is over capacity. Trying to receive a plane that is already in the hangar will throw an error.

### Each Plane instance can allow planes to take off

```
boeing_747.take_off(Heathrow)

puts Heathrow.hangar # => []
puts boeing_747.flying # => true
puts boeing_747.airport # => ""
```

If the weather is not stormy, planes can leave the airport. When a plane leaves the airport it is also removed from the hangar. The plane's flying status will set to true and its airport attribute will be an empty string to denote that it no longer is at an airport.

# My approach to Solving this challenge.

## Plane Class:

### Take off and Landing

Planes are not permitted to take off if the weather is stormy. It is not possible to take off from an airport in which that plane is not stored in and no plane can take off if it is already flying.

Planes cannot land if the weather is stormy and an error will be thrown if you try to land a plane that is already on the ground or if the hangar is full.

```
  def take_off(airport)
    fail "Can't take off due to stormy weather!" if airport.stormy?
    fail "This plane is already flying" if flying?
    fail "This plane is not at this airport" unless @airport == airport.airport_id

    airport.hangar.delete(self)
    change_status("", true)
    return airport
  end

  def land(airport)
    fail "Can't land due to stormy weather!" if airport.stormy?
    fail "Can't land, hangar is full!" if airport.full?
    fail "Plane already in airport!" if airport.in_airport?(self)
    
    airport.hangar << self
    change_status(airport.airport_id, false)
    return airport
  end
```
## Attributes

Each Plane instance has a few attributes:

* Flying Status (flying is either true or false)
* Airport (Which airport it is in)

The `change_status` method changes the flight status upon landing and take off 

```
  def initialize
    @flying = true
    @airport = ""
  end

  def flying?
    return @flying
  end

  def change_status(airport_id, flying_status)
    @airport = airport_id
    @flying = flying_status
  end

```

## Airport Class:
### The initialize method sets up some important parameters:

```
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @stormy = rand(9) <= 2
    @full = false
    @capacity = capacity
    @airport_id = object_id
  end
```

### Attributes

It is possible to check if a plane is being stored at the airport, to check if the weather is stormy and if the hangar is full.

```
  def in_airport?(plane)
    return @hangar.include?(plane)
  end

  def stormy?
    return @stormy
  end

  def full?
    @full = (@hangar.length >= capacity)
  end
```
