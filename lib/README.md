
### Airport ###
## A program with some simple Airport-like functions ##
# To make orginizing flights easier and safer at the same time #

When i was creating this program i had to decide wheter:
- We already have an airplane in air and/or airport

I went with not having any airplanes at all, that means that:
-To make an airplane we should use [ (random_airport_name = Airport.new).create_plane(plane = Plane.new) ] instead of ( plane = Plane.new ) becouse otherwise it will be created in an imaginary space and you will not be able to do any action with it!!

The decision was based on a fact that airplanes do not start their existance in air.
Lets say we want to have an airplane fly from Moscow to Warsaw:
-First it has to exist in Moscow to start the flight 
-So we need to make it there first
-So later on it can start the journey
-So we can be aware that its coming to our airport [( Warsaw in this case ), (Like in real life, airports dont accept some random-ass airplanes from nowhere)]
-And only after those steps it can land in Warsaw

So more specificly how do we do this in code:
-Create both Airports
-Create plane in Moscow
-Let the plane in Moscow fly away 
-Make it land in Warsaw

So the journey looks like this - Moscow > sky > Warsaw.

I would like to implement later on a function which lets you create an airplane in air.
This could be useful for times where a Plane which was not suposted to land in our airport, would be able to in case of emergency for example.
In code it simply means that whenever we use Plane.new its DEFAULT_POSITION is in air unless we specificaly create it in an airport.
So we can basically decide on (Plane.new)'s starting position that way.
