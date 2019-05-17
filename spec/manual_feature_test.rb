require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'

airport = Airport.new('Los Santos International','LSX')
plane = Plane.new
different_airport = Airport.new('Death Star Spaceport', 'DHS')

plane.land(airport)
# => "Plane landed at airport!"

airport.planes
# => [plane object]

plane.take_off(airport)
# => taken off
plane.land(airport)
# => landed
plane.take_off(different_airport)
# => "I'm not at that airport!"