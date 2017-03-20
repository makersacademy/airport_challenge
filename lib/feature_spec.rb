require_relative 'airport'
require_relative 'plane'
require_relative 'weather'

airport = Airport.new
20.times do
  plane = Plane.new
  puts airport.land(plane)
  puts airport.take_off(plane)
end
