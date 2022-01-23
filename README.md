** Airport challenge

# Makers academy airport challenge:

Write the software to control the planes at an airport from a given set of user stories. Written using Ruby. A command line program using Test Driven Development principles

I have not completed this challenge within the timeframe given.

# Completed:
  seperate files for each class, module and test suite
  User stories diagrammed and charted
  tests created for landing and taking off a plane
  Some code implemented for capacity of airport class, take off and landing

If I had further time I would implement the Weather class properly to generate weather.
I would write better tests to test features
I would also refactor my code to better follow single responsibilty principles

# User instructions

```

benfielding@Bens-Air airport_challenge % irb
3.0.2 :001 > require './lib/airport.rb'
 => true 
3.0.2 :002 > airport = Airport.new
 => #<Airport:0x000000012f8143b0 @capacity=10, @planes=[]> 
3.0.2 :003 > boeing = Plane.new
 => #<Plane:0x0000000128817f30> 
3.0.2 :004 > airport.land_plane(boeing)
 => "Successful Landing" 
3.0.2 :005 > airport.take_off(boeing)
 => [] 
3.0.2 :006 > 

```

