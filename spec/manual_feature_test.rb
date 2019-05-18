require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'
weather = Weather.new
airport = Airport.new(weather, 'Los Santos International','LSX')
plane = Plane.new

different_airport = Airport.new(weather, 'Death Star Spaceport', 'DHS')

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

plane.land(airport) # stormy
# => I can't land, it's stormy! Let's hope the weather clears up soon...