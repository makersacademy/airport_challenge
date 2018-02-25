require_relative './lib/airport'
require_relative './lib/plane'
require_relative './lib/weather'

class Run
  massive_airport = Airport.new('Heathrow',100)
  not_a_massive_airport = Airport.new('London City')
  useless_airport = Airport.new('My Back Garden',0)

  weather = Weather.new()
  for i in (1..20)
    massive_airport.land(Plane.new(i), false)
  end

  massive_airport.hanger.each { |plane| puts plane }
end

show_landed_planes

end
