require 'airport'

describe Airport do
  
#   it 'can respond to plan landing' do
#     expect(subject).to respond_to(:land_plane)
#   end
  it { is_expected.to respond_to :land} # one-liner syntax
  
  it { is_expected.to respond_to :take_off} 
  
  
#   it 'instruct plane to land at airport' do
#     # airport = Airport.new
#     # plane = airport.land_plane
#     expect(plane).to respond_to(:land_plane)
#     subject.land_plane(plane)
#   end
end


# it 'can respond to plane' do
#     airport = Airport.new
#     plane = Plane.new
#     expect(airport).to respond_to(:plane)
#   end

#   it 'should land a plane' do
#     # airport = Airport.new
#     plane = Plane.new
#     subject.land(plane)
#     expect(subject.land(plane)).to eq(plane) # .with(1).argument
#   end
# bject.land_plane(plane)
#     expect(subject.planes).to include plane
#     end

#     it 'has planes that have landed' do
#         plane = Plane.new
#         subject.land(plane, 3)
#         expect(subject.grounded_planes).to include(plane)
# should land a plane in the airport