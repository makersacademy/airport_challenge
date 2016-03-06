require_relative 'plane'
require_relative 'airport'

gatwick = Airport.new

10.times{Plane.new.land(gatwick)}
p 1.0
p gatwick.planes

gatwick.planes.each do |plane|
  plane.take_off(gatwick)
end

gatwick.planes.each do |plane|
  plane.take_off(gatwick)
end

p 2.0
p gatwick.planes.length
p gatwick.planes
