# require 'plane'
# require 'airport'
#
# describe Plane do
#   context '#land' do
#     it { is_expected.to respond_to :land }
#
#     it 'plane starts on the ground' do
#       plane = Plane.new
#       expect(plane.flying).to eq false
#     end
#
#     it 'lands the plane' do
#       plane = Plane.new
#       plane.land
#       expect(plane.flying).to eq false
#     end
#
#     it 'lands 1 plane in an airport' do
#       plane = Plane.new
#       airport = Airport.new
#       plane.land(airport)
#       expect(airport.local_planes).to eq plane
#     end
#   end
#
#   context '#take_off' do
#     it 'takes_off' do
#
#     end
#   end
# end
