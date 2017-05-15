# Airport Challenge
## Makers Academy Week 1 Weekend Challenge

### What it Does
Emulates a basic air traffic control system.

### How to Use

#### Load the file:
```
2.4.0 :001 > require './lib/airport.rb'
 => true
```
#### Make an airport (override default capacity if desired), make a plane:
```
2.4.0 :002 > airport = Airport.new
 => #<Airport:0x007fa419168798 @weather="sunny", @capacity=20, @planes=[]>
2.4.0 :003 > airport.override_capacity(50)
 => 50
2.4.0 :004 > plane = Plane.new
 => #<Plane:0x007fa419158e38>
```
#### Land and launch planes:
```
2.4.0 :006 > airport.lands_plane(plane)
 => "The plane has landed!"
2.4.0 :007 > airport.planes
 => [#<Plane:0x007fa419158e38>]
2.4.0 :008 > airport.launches_plane(plane)
 => "The plane has taken off!"   
```
#### Generate weather conditions (sunny by default, generating has a 1 in 10 chance of being stormy):
```
2.4.0 :009 > airport.generate_weather
 => "sunny"
2.4.0 :012 > airport.generate_weather
 => "stormy"
```
#### Planes won't land or take off in bad weather:
```
2.4.0 :015 > airport.lands_plane(plane)
 => "Plane could not land due to stormy weather."
2.4.0 :016 > airport.launches_plane(plane)
 => "Plane could not take off due to stormy weather."
```

### My Approach

My approach was to work very slowly and test as many facets of the program as I could, so that each test/pass/refactor consisted of relatively small changes.

I haven't implemented doubles for testing the weather system to the extent that I would have liked to, but I'm hoping to refactor this when I have a better understanding of test doubles, mocks and stubbing.

One mistake I made was to initially put almost all methods into the Airport class, so at the point of my first pull request the Plane class was empty. This is something that I'm refactoring at the moment because Plane objects really need some fleshing out! I would also like to implement a plane status feature so a user can easily see where a specific plane is.
