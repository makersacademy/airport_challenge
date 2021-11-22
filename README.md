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

Overview
---------

* This exercise was carried out at the end of Week 1 of the Makers bootcamp in order to consolidate our knowledge of TDD using Ruby.
* We were given several user stories and asked to create a program that met these requirements using Ruby.

User Stories
-------

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

Approach
-----

Based on these user stories, I decided to center the program around two main objects: airport and plane. I implemented these as classes.
To ensure the basic functionality of these stories, I defined three methods: land, takeoff, and at_airport?, on the Airplane class that take Plane objects as parameters.

From the user story describing the need for the ability to set a capacity, I decided to initialize the Plane class with a default capacity of 10 through the constant DEFAULT_CAPACITY. It is also clear from this story that Airports need to be able to store multiple Planes, so I initialized the class with an array @planes. The land and takeoff methods therefore add and remove elements from this array.

The final part of my approach was the landing and takeoff checks. We can't land if an airport is full, or if it is stormy. We can't take off if it is stormy. I also addressed edge cases: planes can't land if they aren't flying, only planes can land at airports, planes can't take off from airports they aren't at.

Solution
-----

**Plane Class**

```
class Plane
  attr_accessor :flying

  def initialize
    @flying = true
  end
end
```
Plane objects are intialized with a @flying attribute, which includes an attr_accessor as this attribute needs to be accessed and edited by methods defined on the Airport class.

**Airport Class**

```
attr_reader :planes, :capacity, :stormy

  DEFAULT_CAPACITY = 10
  LIKELIHOOD_OF_STORMINESS = 0.2

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    rand < LIKELIHOOD_OF_STORMINESS ? @stormy = true : @stormy = false
  end

```
Airport objects are initialized with three attributes.
**@capacity** this is the airport's capacity and defaults to DEFAULT_CAPACITY (10) in the abscence of user input.
**@planes** this is an array containing the planes that have landed at the airport.
**@stormy * whether a particular airport is stormy or not is determined randomly at the point of initialization. There is a 20% chance (LIKELIHOOD_OF_STORMINESS) that it will be stormy.

```
  def land(plane)
    landing_check(plane)
    plane.flying = false
    @planes << plane
  end

  def landing_check(plane)
    fail "Airport full" if full?
    fail "Cannot land at stormy airport" if @stormy
    fail "Only planes can land at an airport" if plane.class != Plane
    fail "Only flying plane can land" if plane.flying == false
  end

```
**Landing the plane**

The method **land(plane)** firstly calls the **landing_check(plane)** method to verify whether the plane can land. It will not be allowed to land if the airport is full, if it is stormy, if the plane is not a Plane object, or if the plane is not flying.

When the plane lands, it will no longer be flying.

The plane is added to the @planes array.

```

  def takeoff(plane)
    takeoff_check(plane)
    plane.flying = true
    @planes.reject! { |planes| planes == plane }
  end

  def takeoff_check(plane)
    fail "Cannot takeoff from stormy airport" if @stormy
    fail "Specified plane not at this airport" if at_airport?(plane) == false
    fail "Plane cannot take off if it is already flying" if plane.flying == true
  end

```

**Plane takeoff**

The method **takeoff(plane)** firstly calls the **takeoff_check(plane)** method to verify whether the plane can take off. It will not be allowed to take off if it is stormy, if the plane is not at the airport, or if the plane is already flying.

When the plane takes off, it will be flying.

The plane is removed from the @planes array.

```
def full?
    @planes.length == capacity
  end
```
Checks if an airport is full to capacity. Used by the land(plane) function.

```
  def at_airport?(plane)
    @planes.include?(plane)
  end
```

Checks if a specified plane is at the airport. Used by the takeoff(plane) function.

Notes
---------

This solution was implemented using a TDD approach. I first defined unit tests and then implemented the code to address them in the most simple way.
All Rspec tests pass, and stylistic errors have also been removed with the aid of Rubocop.
In order to ensure consistent behavior in tests, srand was used to produce deterministic behavior in random variables (@stormy).
