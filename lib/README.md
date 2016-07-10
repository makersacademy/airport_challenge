Joses-MBP:airport_challenge josecopovi-king$ irb
2.2.3 :001 > require './lib/airport.rb'
 => true
2.2.3 :002 > airport1 = Airport.new
 => #<Airport:0x007fec12004870>
2.2.3 :003 > plane1 = Plane.new
 => #<Plane:0x007fec1101cb38>
2.2.3 :004 > airport1.land_plane(plane1)
 => "#<Plane:0x007fec1101cb38> has landed"
