require '/Users/Suse/Documents/Coding/week1challenge/airport_challenge/lib/airport'

describe 'feature test' do

    it 'allows planes to move in and out of airports' do
 airport = Airport.new
 weather = Weather.new
 weather.stormy?
 plane = Plane.new
 airport.land(plane)
 airport
 airport.take_off
 airport
#puts 20.times { airport.land(plane) }
 end
 end

#     airport1 = Airport.new
#     allow(airport1.weather).to receive(:stormy?) { false }
#     plane1 = Plane.new
#     plane2 = Plane.new
#     airport1.land(plane1)
#     airport1.land(plane2)
#     plane1.landed?
#     airport2 = Airport.new 1
#     allow(airport2.weather).to receive(:stormy?) { false }
#     airport1.take_off(plane1)
#     airport2.land(plane1)
#     airport1.take_off(plane2)
#   end
#
# end
