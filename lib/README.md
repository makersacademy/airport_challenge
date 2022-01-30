Guide on how to work this script
---------
The following is a brief example of how a user would create an instance of an airport and two plane, and then
make the instances interact with one another via landing & taking off.

```
3.0.2 :001 > airport = Airport.new
 => #<Airport:0x0000000134b09e30 @capacity=10, @planes_in_airport=[]>
3.0.2 :002 > plane_1 = Plane.new
 => #<Plane:0x0000000134d08948>
3.0.2 :003 > plane_2 = Plane.new
 => #<Plane:0x0000000134bf31e8>
3.0.2 :004 > airport.land(plane_1)
 => [#<Plane:0x0000000134d08948>]
3.0.2 :005 > airport.land(plane_2)
 => [#<Plane:0x0000000134d08948>, #<Plane:0x0000000134bf31e8>]
3.0.2 :006 > airport.planes_in_airport
 => [#<Plane:0x0000000134d08948>, #<Plane:0x0000000134bf31e8>]
3.0.2 :007 > airport.take_off(plane_1)
 => "#<Plane:0x0000000134d08948> has successfully taken_off from #<Airport:0x0000000134b09e30>."
3.0.2 :008 > airport.planes_in_airport
 => [#<Plane:0x0000000134bf31e8>]
3.0.2 :009 > airport.take_off(plane_2)
 => "#<Plane:0x0000000134bf31e8> has successfully taken_off from #<Airport:0x0000000134b09e30>."
3.0.2 :010 > airport.planes_in_airport
 => []
```