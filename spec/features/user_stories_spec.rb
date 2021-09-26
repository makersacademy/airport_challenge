
# describe Airport do
#     it 'so planes land at airports, instucts a plane to land' do
#         airport = Airport.new(10)
#         plane = Plane.new
#         expect {airport.land(plane)}.not_to raise_error
#     end

#     it 'so planes take off from airports, instuct a plane to land' do
#         airport = Airport.new(10)
#         plane = Plane.new
#         allow(airport).to recieve(:stormy?).and_return false
#         expect {airport.take_off(plane)}.not_to raise_error
#     end
   
#     it 'prevents planes landing when airport is full' do
#         airport = Airport.new(10)
#         plane = Plane.new
#         allow(airport).to recieve(:stormy?).and_return false
#         10.times { airport.land(plane) }
#         expect{airport.land(plane)}.to raise_error "The airport is full!"
#     end

#     # As the system designer
#     # So that the software can be used for many different airports
#     # I would like a default airport capacity that can be overridden as appropriate
#     # it 'It has a defualt capacity that can be overridden as approriate.' do
#     #     airport = Airport.new(capacity = 10)
#     #     plane = Plane.new 
#     #     airport
#     # end
#     # As an air traffic controller 
#     # To ensure safety 
#     # I want to prevent takeoff when weather is stormy 

#     it 'prevents planes from take_off weather is stormy' do
#     airport = Airport.new(10)
#     plane = Plane.new
#     is_expected.to respond_to :stormy.and_return true
#     airport.take_off(plane).to raise_error "You cannot take off the weather is stormy" 
#     end

# end

