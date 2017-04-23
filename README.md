# Airport Challenge
#### (Forked from [makersacademy/airport_challenge](https://github.com/makersacademy/airport_challenge))

## A system modeling the functionality of an airport.
- Airports allow any number of planes as a capacity
- Specific planes can take-off and land
- Planes can be confirmed landed
- Planes cannot take-off or land if weather conditions are bad (generated randomly)
- User warned when airport is full or empty

#### Example:

```
[4] pry(main)> airport = Airport.new
=> #<Airport:0x007fa8b1acac90
 @capacity=10,
 @runways=
  [#<Airplane:0x007fa8b1acaba0>,
   #<Airplane:0x007fa8b1acab78>,
   #<Airplane:0x007fa8b1acab28>,
   #<Airplane:0x007fa8b1acaa38>,
   #<Airplane:0x007fa8b1acaa10>,
   #<Airplane:0x007fa8b1aca9e8>,
   #<Airplane:0x007fa8b1aca9c0>,
   #<Airplane:0x007fa8b1aca998>,
   #<Airplane:0x007fa8b1aca970>,
   #<Airplane:0x007fa8b1aca948>],
 @weather=#<Weather:0x007fa8b1acac68>>
[5] pry(main)> plane = airport.runways[0]
=> #<Airplane:0x007fa8b1acaba0>
[6] pry(main)> airport.take_off(plane)
RuntimeError: No taking off or landing allowed while weather is stormy.
from /Users/Fasolin/Projects/airport_challenge/lib/weather.rb:4:in `stormy?'
[7] pry(main)> airport.take_off(plane)
=> #<Airplane:0x007fa8b1acaba0>
[8] pry(main)> airport.landed?(plane)
=> false
[9] pry(main)> airport.land(plane)
=> [#<Airplane:0x007fa8b1acab78>,
 #<Airplane:0x007fa8b1acab28>,
 #<Airplane:0x007fa8b1acaa38>,
 #<Airplane:0x007fa8b1acaa10>,
 #<Airplane:0x007fa8b1aca9e8>,
 #<Airplane:0x007fa8b1aca9c0>,
 #<Airplane:0x007fa8b1aca998>,
 #<Airplane:0x007fa8b1aca970>,
 #<Airplane:0x007fa8b1aca948>,
 #<Airplane:0x007fa8b1acaba0>]
[10] pry(main)> airport.landed?(plane)
=> true
[11] pry(main)> airport.flying?(plane)
=> false
[12] pry(main)> 10.times { airport.take_off(airport.runways[-1]) }
RuntimeError: Airport is empty.
[13] pry(main)> 10.times { airport.land(Airplane.new) }
RuntimeError: Airport is full.
```
