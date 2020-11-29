require './lib/airport.rb'

capacity = 5
airport = Airport.new(capacity)
plane = Plane.new

p "This is a landing plane: #{airport.land(plane)}"

p "This is a plance taking off: #{airport.takeoff(plane)}"

p "This is a test of the airport being full: #{airport.full?}"

p "This is the capacity of the airport: #{airport.capacity}"

capacity.times { airport.land(Plane.new) }
p "This is a test of the airport being full: #{airport.full?}"

p "This is a test of the airport being stormy? #{airport.stormy?}"

p "This is a test of plane landing at a full airport: #{airport.land(Plane.new) }"
