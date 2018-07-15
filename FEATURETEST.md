```
require './lib/airport'
require './lib/plane'
gatwick = Airport.new('Gatwick')
heathrow = Airport.new('Heathrow', 30)
boeing = Plane.new('Boeing 747')
jetliner = Plane.new('Jetliner')
boeing.airport_name
gatwick.land(boeing)
boeing.airport_name
gatwick.planes
jetliner.land(gatwick)
gatwick.planes
boeing.take_off
boeing.airport_name
gatwick.planes
```
