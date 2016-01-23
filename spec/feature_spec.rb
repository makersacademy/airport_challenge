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
		expect(airport.planes).to_not include plane
	end
end

describe 'prevent departure when weather is stormy' do
	it 'prevents departure' do 
		plane = Plane.new
		airport = Airport.new
		airport.land(plane)
		allow(airport).to receive(:stormy?) {true}
		expect{airport.depart(plane)}.to raise_error("unsafe flying conditions to depart")

	end
end

describe 'prevent landing when weather is stormy' do
	it 'prevents landing' do 
		plane = Plane.new
		airport = Airport.new
		airport.land(plane)
		allow(airport).to receive(:stormy?) {true}
		expect{airport.land(plane)}.to raise_error("unsafe flying conditions to land")

	end
end


describe 'prevent landing when airport is full' do
	it 'prevents landing when airport is full' do 
		plane = Plane.new
		airport = Airport.new
		airport.capacity.times { airport.land(plane) }
		expect{airport.land(plane)}.to raise_error("airport at capacity")

	end
end
