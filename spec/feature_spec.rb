describe 'Landing a plane' do
	it 'lands a plane' do 
		plane = Plane.new
		airport = Airport.new
		airport.land(plane)
		expect(airport.planes).to include plane
	end
end