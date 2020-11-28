require 'airport'

describe Airport do

  it 'allows planes to land in an airport' do
    airport = Airport.new
    expect(airport).to respond_to(:land_plane)
  end

  it 'allows planes to take off from an airport' do
    airport = Airport.new
    expect(airport).to respond_to(:take_off)
  end

end
