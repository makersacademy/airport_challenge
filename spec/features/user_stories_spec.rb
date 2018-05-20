# describe "user stories" do
#   let(:airport) { Airport.new(20) }
#   let(:plane) { Plane.new }
#
#   context 'when it is not stormy' do
#     # As an air traffic controller
#     # So I can get passengers to a destination
#     # I want to instruct a plane to land at an airport
#     it 'for a plane to land at an airport, instruct a plane to land' do
#       allow(airport).to receive(:stormy?).and_return false
#       expect { airport.land(plane) }.not_to raise_error
#     end
#
#   # As an air traffic controller
#   # So I can get passengers on the way to their destination
#   # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
#     it 'for a plane to take off from an airport, instruct a plane to take off' do
#       allow(airport).to receive(:stormy?).and_return false
#       expect { airport.take_off(plane) }.not_to raise_error
#     end
#   end
#
#   context 'when it is stormy' do
#     it 'prevents plane from taking off' do
#       allow(airport).to receive(:stormy?).and_return true
#       expect { airport.take_off(plane) }.to raise_error 'Cannot take off: stormy weather'
#     end
#   # # As an air traffic controller
#   # # To ensure safety
#   # # I want to prevent landing when weather is stormy
#     it 'prevents plane from landing' do
#       allow(airport).to receive(:stormy?).and_return true
#       expect { airport.land(plane) }.to raise_error 'Cannot land: stormy weather'
#     end
#   end
# # As an air traffic controller
# # To ensure safety
# # I want to prevent landing when the airport is full
#   context 'when airport is full' do
#     it 'does not allow planes to land' do
#       allow(airport).to receive(:stormy?).and_return false
#       20.times do
#         airport.land(plane)
#       end
#       expect { airport.land(plane) }.to raise_error 'Cannot land: airport full'
#     end
#   end
# end
