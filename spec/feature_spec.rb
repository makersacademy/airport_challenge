describe 'Landing a plane' do
	it 'lands a plane' do 
		plane = Plane.new
		airport = Airport.new
		airport.land(plane)
		expect(airport.planes).to include plane
	end
end

describe 'depart plane' do
	it 'takes off a plane' do 
		plane = Plane.new
		airport = Airport.new
		airport.land(plane)
		airport.depart(plane)
		expect(airport.planes).not_to include plane
	end
end