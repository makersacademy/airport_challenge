describe 'User Stories' do

#1. As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

it 'planes need to land at airports, instructs planes to land at airport' do
	airport = Airport.new(20)
	plane = Plane.new
	airport.land(plane)
  	expect { airport.land(plane)}.not_to raise_error
end


#2. As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

it 'i want to instruct a plane to take off from an airport' do
	airport = Airport.new(20)
	plane = Plane.new
	airport.take_off(plane)
	expect { airport.take_off(plane).not_to raise_error }
end

#3. As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

it 'i want to stop planes landing when the airport is full' do
	airport = Airport.new(20)
	plane = Plane.new
	20.times do 
		airport.land(plane)
	end
	expect { airport.land(plane) }.to raise_error 'Airport full, cannot land plane'
	end
end


#4.1 As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy


#4.2 As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy



# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

