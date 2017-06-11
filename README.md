
## Airport Challenge ##

A CL-script controlling aircraft flow in and out of airports. Two major constraints are set on aircraft flow. One is that airports cannot land planes when their hangers are full, the other that airports cannot takeoff or land planes when it's stormy. Logical constraints are also enforced: airports can't land or takeoff planes that are already grounded or airborne respectively. And location matters. An airport can only takeoff its own planes, not those belonging to another airport.

The capacity of airports can be set on their creation. If not specified they will default to 20.

## Run ##

Run the following commands:

```
$ git clone git@github.com:jkingharman/airport_challenge.git
$ cd airport_challenge
$ bundle
$ ruby ./lib/airport.rb

```

## My Approach ##

I split the the programmes's responsibilities over three classes: airport, weather, and plane.

Broadly:

Airport understands how to land and take off aircraft.

Plane understands how to move through air.

Weather understands how to sometimes be stormy.

__Airport__

This class creates instances of airports. Airports's public interface consists of the methods 'land' and 'take_off', which take instances of Plane as arguments. These methods check some things. Namely:

•	the in_flight state of the plane
•	the weather's conditions.
•	the capacity of the airport's hanger.

When all of these checks pass, the methods then either call 'land' or 'fly' on the plane
passed in. The effect of this is to alter the planes in_flight status.

__Plane__

Creates instances of planes.

__Weather__

Airport depends on instances of Weather. When airports are created, a weather object is injected into them. The weather object's public interface consists of 'stormy?'. It varies its state by periodically sampling certain weather conditions throughout the lifespan of the script (sampling occurs within a thread), and stormy returns true or false depending on the current condition.
