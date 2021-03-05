require 'airport'

describe 'Airport'do
  # it 'instructs a plane to land when the capacity is 20 or less'do
  #   airport = Airport.new(20, true)
  #   plane = Plane.new
  #   expect(airport.instruct_plane_land(plane)).to eq(true)
  # end

  # it 'does not instructs a plane to land when the capacity is more than 20'do
  #   airport = Airport.new(21, true)
  #   plane = Plane.new
  #   expect(airport.instruct_plane_land(plane)).to eq(false)
  # end

   it' instructs a plane to take off when the weather is not stormy 'do
    airport = Airport.new(20, false)
    plane = Plane.new
    airport.take_off(plane)
    expect(airport.take_off(plane)).to eq(true)
  end

  it' instructs a plane to not take off when the weather is stormy 'do
   airport = Airport.new(20, true)
   plane = Plane.new
   airport.take_off(plane)
   expect(airport.take_off(plane)).to eq(false)
 end
 it ' prevents a plane to land when the wheather is stormy'do
  airport = Airport.new(17, true)
  plane = Plane.new
  expect{airport.land(plane)}.to raise_error " Not allowed to land stormy weather "
end

  it ' alloweds a plane to land when the wheather is not stormy'do
  airport = Airport.new(20, false)
  plane = Plane.new
  expect(airport.land(plane)).to eq(true)
end

it ' it confirms that theres is no longer plane in the airport' do
  airport = Airport.new(0, false)
  plane = Plane.new
  expect(airport.confirm_no_plane(plane)).to eq(true)
  end

  it ' it confirms that there is plane in the airport' do
    airport = Airport.new(20, true)
    plane = Plane.new
    expect(airport.confirm_no_plane(plane)).to eq(false)
  end
    # it 'it raises an error when the wather is stormy'do
    # airport = Airport.new(20, true)
    # plane = Plane.new
    # expect(airport.land(plane)).to raise_error "Not allowed to land stormy weather"
    # end
 end




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
