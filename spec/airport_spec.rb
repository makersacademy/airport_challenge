require 'airport'

describe 'Airport'do
  it 'instruct a plane to land'do
    airport = Airport.new
    plane = Plane.new
    expect(airport.instruct_plane_land(plane)).to eq(0)
  end

  # it' confirms that it is no longer planes in the airport'do
  # airport = Airport.new
  # airport.confirm_no_plane
  # expect(airport.confirm_no_plane).to eq(0)
end

# it' prevent the plane to land when the airport is full'do
# airport = Airport.new
  #plane = Plane.new
#  airport.prevent_landing_full?
#  expect(airport.prevent_landing_full?).to eq.(true)
# end

# it' prevents the plane landing when the wheather is stormy' do
#   airport = Airport.new
#   plane = Plane.new
#   plane.instruct_plane_land
#   expect(airport).to eq('no landing')
# end



#  describe 'Plane'do
# it' lands  if the airport is empty' do
#    airport = Airport.new
#    plane = Plane.new
#    airport.confirm_no_plane
#    expect(plane.land).to  eq(0)
#  end
# end
