Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____DM____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```
An airport simulation that allows planes to land and take off from an airport. An airport will generate with a default capacity unless otherwise specified when creating a new Airport.

Planes in this airport will be allowed to land and take off, unless the weather conditions are stormy.

```
ruby airport.rb
```
```
3.0.2 :001 > airport = Airport.new
 => #<Airport:0x000000014b812620 @capacity=20, @hangar=[]> 
3.0.2 :002 > plane = Plane.new
 => #<Plane:0x000000015e962ee0> 
3.0.2 :003 > airport.land(plane)
 => [#<Plane:0x000000015e962ee0>]
 3.0.2 :001 > airport = Airport.new
 => #<Airport:0x00000001372b6528 @capacity=20, @hangar=[]> 
3.0.2 :002 > airport.land(Plane.new)
 => [#<Plane:0x0000000115844b88>] 
3.0.2 :003 > airport.takeoff
=> Too stormy to take off (RuntimeError)
3.0.2 :004 > airport.takeoff
Plane #<Plane:0x0000000115844b88> has taken off
 => #<Plane:0x0000000115844b88> 
```

Review
-----

While the code in this repo is solid, and has a 98.88% coverage, there are a few improvements I would make if I came back to this challenge with more experience

1. Separate the Weather class into its own file
        - I inititally had this set up, but really struggled to get test doubles to work correctly and so, in order to submit a working solution, I placed the Weather class into the airport.rb file
2. Improving the DRY principle in the spec file
        - I couldn't properly work out how to implement the 'before' block in my spec file, which would have removed the need for me to repeat the 'good_weather' / 'bad_weather' stubs
3. Protect against edge cases better
        - While my code runs well, I definitely think there are improvements to be made with edge cases. I don't have any check in here to see if a landing plane already exists in the hangar, but didn't quite have the time to add these in to the code.

I didn't manage to make it to the BONUS challenge but I'm happy with the functionality I did create
```
BONUS
* Write an RSpec **feature** test that lands and takes off a number of planes
```

Overall, while I'm sure there are improvements to be made, I'm very pleased with how this code works and how I put it together. I checked the rubric once to clarify how the weather should be generated (I was initially going to have a random weather generator inside the airport class, but checked the rubric to clarify and saw a separate class), but the rest of the code is self-written.

Original Challenge Brief
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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.
