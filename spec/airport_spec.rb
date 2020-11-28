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

  it 'returns message to say plane has taken off after take_off' do
    airport = Airport.new
    expect(airport.take_off).to eq "Plane has taken off"
  end

end
