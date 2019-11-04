require './docs/airport'

describe Airport do

it 'creates an instance of airport class' do
  airport = Airport.new
  expect(airport).to be_instance_of(Airport)
end
it 'is expected to respond to :airplanes' do
  airport = Airport.new
  expect(airport).to respond_to(airplanes)
end
end

# it 'has a specific capacity of planes' do
#   airport = Airport.new
# end

#respond to method land_plane

#allow a plane to land

#respond to method takeoff_plane


#respond to the array of airplanes
