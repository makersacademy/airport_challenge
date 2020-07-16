require './docs/airport'

describe Airport do
let (:plane) {double :plane}

it 'creates an instance of airport class' do
  airport = Airport.new
  expect(airport).to be_instance_of(Airport)
end

it 'is expected to respond to :airplanes' do
  airport = Airport.new
  expect(airport).to respond_to :planes
end



# it 'has a specific capacity of planes' do
#   airport = Airport.new
# end

# it 'has a default capacity that can be overwritten' do
# plane_cap = Airport.new(20)
#expect(plane_cap.capacity).to eq 20
#end

#respond to method land_plane
it 'responds to land plane' do
expect :plane.to respond_to(land_plane)
end
#allow a plane to land

#respond to method takeoff_plane


#respond to the array of airplanes
end
