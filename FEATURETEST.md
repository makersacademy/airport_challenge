```
require './lib/airport'
require './lib/plane'
gatwick = Airport.new('Gatwick')
lax = Airport.new('L.A.X.')
boeing = Plane.new('Boeing 747')
gatwick.land(boeing)
boeing.take_off
boeing.land(lax)
```
