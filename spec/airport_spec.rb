require 'airport'

describe Airport do

  it 'allows the method land to be called on an instance of airport' do
    airport = Airport.new
    expect(airport).to respond_to(:land_plane)
  end

end
