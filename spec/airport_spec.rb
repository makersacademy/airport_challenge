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

	it 'plane should respond to the take_off method' do
			airport = Airport.new
			plane = Plane.new
			plane.land(airport)
			expect { plane.take_off(airport) }.to_not raise_error
	end

	it 'the plane shold exit the hanger when it takes off' do
			plane = Plane.new
			airport = Airport.new
			plane.land(airport)
			plane.take_off(airport)
			expect(airport.hanger).to eq([])
	end

	it 'a plane should not be able to land if the airport is full' do
			airport = Airport.new
			10.times { airport.hanger << Plane.new }
			plane = Plane.new
			expect { plane.land(airport) }.to raise_error 'airport full'
	end

	it 'method storm? should return true if stormy' do
			airport = Airport.new
			airport.storm = true
			expect(airport.storm).to eq(true)
	end

	it 'a plane shold not be able to take-off if the weather at the airport is stormy' do 
			airport = Airport.new
			plane = Plane.new
			plane.land(airport)
			airport.storm = true
			expect { plane.take_off(airport) }.to raise_error('take-off denied, there is a storm!')
	end

	it 'a plane should not be able to land if the weather at the airport is stormy' do	
			airport = Airport.new
			plane = Plane.new
			airport.storm = true
			expect { plane.land(airport) }.to raise_error('landing denied, there is a storm!')
	end

	it 'a plane should not be able to take-off from an airport it is not in' do
		airport = Airport.new
		plane = Plane.new
		expect { plane.take_off(airport) }.to raise_error('plane is not in the specified airport')
	end

	it 'a plane should not be able to land if it is not flying' do 
		airport = Airport.new
		plane = Plane.new
		plane.land(airport)
		expect {plane.land(airport) }.to raise_error('error, plane is not flying') 
	end
end
