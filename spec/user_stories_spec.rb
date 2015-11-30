# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed
# describe 'first user story' do
# 
#   it 'instruct plane to land so that it lands at an airport' do
#     allow(weather).to receive(:stormy?).and_return false
#     airport = Airport.new(50)
#     plane = Plane.new
#     expect {airport.land (plane)}.not_to raise_error
#   end
#
#   it 'plane confirms that it has landed' do
#     airport = Airport.new(50)
#     plane = Plane.new
#     expect {plane.landed?}.not_to raise_error
#   end

# end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
#
# describe 'second user story' do
#
#   it 'instructs plane to takeoff from airport' do
#     airport = Airport.new(50)
#     plane = Plane.new
#     expect {airport.takeoff (plane)}.not_to raise_error
#   end
#
#   it 'plane confirms that it is no longer at the airport' do
    # airport = Airport.new(50)
#     plane = Plane.new
#     expect {plane.flying?}.not_to raise_error
#   end
#
# end

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

# describe 'third user story' do
#   it 'prevents takeoff when weather is stormy' do
#     airport = Airport.new(50)
#     allow(weather).to receive(:stormy?).and_return true
#     expect { airport.land(plane) }.to raise_error
# end
# end
#     plane = Plane.new
#     expect {airport.takeoff (plane)}.to raise_error
#   end
# end

#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

# describe 'fourth user story' do
#   it 'prevents takeoff when weather is stormy' do
#     airport = Airport.new
#     plane = Plane.new
#     expect {airport.takeoff (plane)}.to raise_error
#   end
# end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

# describe 'fifth user story' do
#   it 'prevents landing when airport is full' do
#     allow(weather).to receive(:stormy?).and_return false
#     airport = Airport.new(50)
#     plane = Plane.new
#     50.times do airport.land (plane)
#   end
#   expect {airport.land(plane)}.to raise_error 'airport full'
#   end
# end

# end
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
#

# describe 'sixth user story' do
#   it 'allows default airport capacity to be amended'
# end


# Objects                         Messages
# -----------------------         -----------------------
# Air traffic controller
# -----------------------         -----------------------
# Plane                           Land, take off, confirm take off & landing
# -----------------------         -----------------------
# Airport                         Prevent take off & landing (if bad weather), prevent landing if full
# -----------------------         -----------------------
# Airport                         Full? Confirm capacity
# -----------------------         -----------------------
