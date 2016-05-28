require 'airport'
require 'plane'



describe 'feature test' do
	it 'feature_tests' do
		airport = Airport.new
		plane = Plane.new
		airport.land(plane)
		airport.planes
		airport.takeoff(plane)
	end
end