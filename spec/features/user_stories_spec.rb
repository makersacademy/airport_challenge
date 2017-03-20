# describe 'User Stories' do
#
#     # User story 1
#     it 'so planes land at airports, instruct a plane to land' do
#       heathrow = Airport.new
#       boeing = Plane.new
#       # null test - do not expect this to raise an error
#       expect { heathrow.land(boeing) }.not_to raise_error
#     end
#
#     # User story 2
#     it 'so planes take off at airports, instruct a plane to take off' do
#       heathrow = Airport.new
#       boeing = Plane.new
#       expect { heathrow.take_off(boeing) }.not_to raise_error
#     end
#
#     # User story 3
#     it 'does not allow planes to land when airport is full' do
#       heathrow = Airport.new(50)
#       boeing = Plane.new
#       allow(airport).to receive(:stormy?).and_return false
#       20.times do
#         heathrow.land(boeing)
#       end
#       expect { heathrow.land(boeing) }.to raise_error "Not able to land, airport has reached its capacity"
#   end
#
#     # User story 4
#     it 'does not allow planes to land when stormy' do
#       heathrow = Airport.new(50)
#       plane = Plane.new
#       allow(heathrow).to receive(:stormy?).and_return true
#       expect { heathrow.land(boeing) }.to raise_error 'Too stormy to land the plane!'
#     end
#
# end
