**AIRPORT CHALLENGE - Weekend 1 challenge**

list of classes:
* Airport (planes can take off and land; if capacity is reached, error appears)
* Plane
* Weather (randomly generated status - 1 times out of 5 there is a storm)

```
2.4.0 :001 > require './lib/airport'
 => true
2.4.0 :002 > airport = Airport.new
 => #<Airport:0x007fbea5824e28 @capacity=10, @planes=[], @weather=#<Weather:0x007fbea5824dd8>>
2.4.0 :003 > airport.instruct_take_off Plane.new
 => "Take-off successful"
```

original repo can be found at *github.com/makers-academy/airport-challenge*
find my other work at *github.com/petrah*
