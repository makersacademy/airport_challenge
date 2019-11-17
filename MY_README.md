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

Description
---------

This is the weekend challenge at the end of my first week at Makers Academy, a 16-week software developer bootcamp. For all the instructions, please refer to the main [README](https://github.com/AndreaDiotallevi/airport_challenge/blob/master/README.md).

My approach explanation to solve the challenge
-----

### User story 1:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

**Domain model:**

**Objects** | **Messages**
----------- | ---
Airport     | land(plane)
Plane       |

**Feature test:**

```
airport = Airport.new
=> airport
plane = Plane.new
=> plane
airport.land(plane)
=> plane
```

### User story 2:

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

**Domain model:**

**Objects** | **Messages**
----------- | ---
Airport     | take_off(plane)
Plane       | landed?

**Feature test:**

```
airport = Airport.new
=> airport
plane = Plane.new
=> plane
airport.land(plane)
=> plane
plane.landed?
=> true
airport.take_off(plane)
=> plane
plane.landed?
=> false
```

### User story 3:

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```

**Domain model:**

**Objects** | **Messages**
----------- | ---
Airport     | full? (private method)

**Feature test:**

```
airport = Airport.new
=> airport
plane = Plane.new
=> plane
airport.land(plane)
=> plane
plane_2 = Plane.new
=> plane_2
airport.land(plane_2)
=> RuntimeError (Cannot land as the airport is full)
```

### User story 4:

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

**Domain model:**

**Objects** | **Instance Variables** | **Constants**
----------- | ---------------------- | ---
Airport     | capacity               | DEFAULT_CAPACITY = 50

**Feature test:**

```
airport = Airport.new(10)
=> airport
10.times { airport.land(Plane.new) }
=> 10
airport.land(Plane.new)
=> RuntimeError (Cannot land as the airport is full)
```

### User story 5:

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```

**Domain model:**

**Objects** | **Messages**
----------- | ---
Airport     | take_off(plane)
Plane       |
Weather     | stormy?

**Feature test:**

```
airport = Airport.new
=> airport
airport.take_off(Plane.new)
=> RuntimeError (Cannot take off due to stormy weather)
```

### User story 6:

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

**Domain model:**

**Objects** | **Messages**
----------- | ---
Airport     | land(plane)
Plane       |
Weather     | stormy?

**Feature test:**

```
airport = Airport.new
=> airport
plane = Plane.new
=> plane
airport.land(plane)
=> RuntimeError (Cannot land due to stormy weather)
```

RSpec tests tree
---------

```
Airport
  has a default capacity
  #initialize
    should be able to override the instance variable capacity
  #land
    when the weather is stormy
      should raise an error
    when the weather is not stormy
      should be able to land one plane
      should raise an error if the airport is full
      should raise an error if the plane has already landed
  #take_off
    when the weather is stormy
      should raise an error
    when the weather is not stormy
      should be able to take off a plane
      should raise an error if the plane has not landed in this airport

Plane
  #landed?
    should return a boolean
  #land
    should return true
  #take_off
    should return false

Weather
  #stormy?
    should return a boolean
```