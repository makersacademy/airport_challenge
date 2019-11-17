
# Airport
## A program with some simple Airport-like functions
### To make orginizing flights easier and safer at the same time
#### For specifics scroll to the bottom

When i was creating this program i had to decide wheter:
- We already have an airplane in air and/or airport

I went with not having any airplanes at all, that means that:
- To make an airplane we should use [ (random_airport_name = Airport.new).create_plane(Plane.new) ] instead of ( plane = Plane.new ) becouse otherwise it will be created in 'air' which is not logical.
- You can still create a plane using just plane = Plane.new, as a function for planes that need emergency landing for example [ so to say it (the plane) was not expected at given airport ]

Lets say we want to have an airplane fly from Moscow to Warsaw:
- First it has to exist in Moscow to start the flight 
- So we need to make it there first
- So later on it can start the journey
- So we can be aware that its coming to our airport [( Warsaw in this case ), (Like in real life, airports dont accept some random-ass airplanes from nowhere)]
- And only after those steps it can land in Warsaw

So more specificly how do we do this in code:
- Create both Airports
- Create plane in Moscow
- Let the plane in Moscow fly away 
- Make it land in Warsaw

So the journey looks like this --- Moscow > sky > Warsaw.
Using just Plane.new to create a plane the journey would look more like --- sky > Warsaw.

#specifics

- Weather class describes the weather, if @weather = 10 the weather is stormy.
- Plane.new creates the plane in the air
- Airport.new.create_plane(Plane.new) creates the plane at the airport
- both .land and .takeoff methods of Airport class require 2 arguments. First being the plane and second being always just Weather.new ( to 'check' so to say the weather )

