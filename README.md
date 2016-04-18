Airport Challenge [![Build Status](https://travis-ci.org/omajul85/airport_challenge.svg?branch=master)](https://travis-ci.org/omajul85/airport_challenge)
=================

**Author:** Omar Alvarez

Task
-----

I have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

The task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. I need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In my tests, the probability of bad weather is 30%. The weather is checked by the airport traffic controllers.

The code defends against edge cases, such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

From user stories to classes
----------------------------

The application has been modeled using 2 classes: `Airport` and `Plane`. The weather is not a class itself. In this example, the Airport has a private method that checks if the weather is fine or not and instructs the planes accordingly.

**Airport class:**
- When initialized, requires 3 args: Name of the airport, Plane class, capacity *optional*.
- The Plane class passed during initialization allow the airport to create some planes objects.
- It has 4 public methods: 
```ruby
  receive_plane(plane)
  release_plane(plane)
  ready_for_landing?
  ready_for_taking_off?
```
 `receive_plane`can be used in 2 cases: if you want to add a plane that comes from the factory, and also is invoked when a plane lands.
 `release_plane` can be used in 2 cases: if you want to remove a plane from the list of available planes (maybe for sending to maintenance, and also is invoked when a plane takes off.
 `ready_for_landing` and `ready_for_taking_off` are methods that check if the conditions are met in order to instruct a plane for landing or taking off. The conditions are the weather and the capacity.
 
 **Plane class:**
- When a new plane is created, by default it has the status `:landed`.
- It has 2 public methods:
```ruby
  land(airport)
  take_off(airport)
```
 `land(airport)` invokes the method receive_plane of the airport class and set the status of the plane to `:landed` if conditions were met for landing. If conditions were not met, it raises an error.
 `take_off(airport)` invokes the method release_plane of the airport class and set the status of the plane to `:flying` if conditions were met for taking off. If conditions were not met, it raises an error.

Instructions
------------

From a user's perspective, this is how the application can be used (do not forget to require the files inside the irb):

```
$ irb
2.3.0 :002 > airport = Airport.new("CDG", Plane, 10)
 => #<Airport:0x007fea7c024e28 @name="CDG", @capacity=10, @planes=[#<Plane:0x007fea7c024dd8 @status=:landed>, #<Plane:0x007fea7c024db0 @status=:landed>]> 
2.3.0 :003 > plane = Plane.new
 => #<Plane:0x007fea7c02e3b0 @status=:landed> 
2.3.0 :004 > airport.receive_plane plane
 => [#<Plane:0x007fea7c024dd8 @status=:landed>, #<Plane:0x007fea7c024db0 @status=:landed>, #<Plane:0x007fea7c02e3b0 @status=:landed>] 
2.3.0 :005 > plane.take_off airport
 => #<Plane:0x007fea7c02e3b0 @status=:flying> 
2.3.0 :006 > plane.land airport
 => "Plane #<Plane:0x007fea7c02e3b0> has landed at CDG" 
2.3.0 :007 > 
```

RSpec
-----

For testing the airport class, I did not use double since when an airport is initialized, by default it contains 2 planes. So, I used one of those planes for testing: `let(:plane) { subject.planes.first }`.

For testing the plane class I used an airport double:

```
let(:airport) { double(:airport, :name => "CDG", :ready_for_landing? => \
  true, :ready_for_taking_off? => true, :planes => [subject]) }
```
For testing the exceptions on my RSpec file, I simply call the functions that should raise the error. Since the errors are handled using `rescue`, the function prints the error message that is raised. I did not find a better way to test the exceptions in RSpec, but at least, in the RSpec results you can see that the error was raised and rescued as expected.