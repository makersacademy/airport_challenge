require 'airport'
require 'plane'



describe 'feature test' do
	it 'feature_tests' do
		airport = Airport.new
		airport = Airport.new(50)
		plane = Plane.new
		airport.land(plane)
		airport.takeoff(plane)
		airport.planes
	end
end