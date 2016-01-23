
describe 'Landing a plane' do
	it 'lands a plane' do 
		airport = Airport.new
		plane = Plane.new
		airport.land(plane)
		expect(airport.planes).to include plane
	end
end