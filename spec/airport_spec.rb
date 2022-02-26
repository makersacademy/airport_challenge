require 'airport'

describe Airport do
	it 'can creat a new airport' do
		expect { Airport.new }.to_not raise_error
	end

	it 'can creat a new plane' do 
			expect { Plane.new }.to_not raise_error
	end

	it 'plane object responds to land method' do
		plane = Plane.new
		expect(plane).to respond_to(:land)
	end

	it 'land method takes arguments' do
		plane = Plane.new
		airport = Airport.new
		expect { plane.land(airport) }.to_not raise_error
	end

	it 'the plane should be in the airport after it lands' do
		plane = Plane.new
		airport = Airport.new
		expect(plane.land(airport)).to eq(airport.hanger)
	end

	it 'plane shoul respond to the take_off method' do
		airport = Airport.new
		plane = Plane.new
		expect { plane.take_off(airport) }.to_not raise_error
	end

	it 'the plane shold exit the hanger when it takes off' do
		plane = Plane.new
		airport = Airport.new
		plane.land(airport)
		plane.take_off(airport)
		expect(airport.hanger).to eq([])
	end
end
