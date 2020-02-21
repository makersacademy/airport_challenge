require './lib/airport.rb'

describe Airport do

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

  it 'lands a plane' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq plane
	end

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

	it 'it takes off a plane, with confirmation that it is no longer in the airport' do
		plane = Plane.new
		airport = Airport.new
		expect(airport.take_off(plane)).to eq 'The plane has taken off and is no longer in the airport'
	end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

	it 'will prevent landing when the airport is full, by raising an error' do
		plane = Plane.new
		airport = Airport.new
		airport.land(plane)
		expect { airport.land(plane) }.to raise_error 'this airport is full!'
	end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

	it 'can change airport capacity' do
		plane = Plane.new
		airport = Airport.new
		expect(airport.change_capacity(20)).to eq 20
	end

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

	
end
