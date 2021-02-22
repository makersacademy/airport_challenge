require 'airport'

describe 'Airport'do
  it 'instruct a plane to land'do
    airport = Airport.new
    expect(airport.instruct_plane_land).to eq(0)
  end

  it' confirms that it is no longer planes in the airport'do
  airport = Airport.new
  airport.confirm_no_plane
  expect(airport.confirm_no_plane).to eq(0)
end

# it' prevent the plane to land when the airport is full'do
# airport = Airport.new
#  airport.prevent_landing_full?
#  expect(airport.prevent_landing_full?).to eq.(true)
# end
end
