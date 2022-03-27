require 'airport'

describe Airport do
  subject(:airport) { airport = Airport.new }
  it 'can instruct plane to land' do
    expect(airport).to respond_to(:land_plane)
  end

  it 'can instruct plane to take off' do
    expect(airport).to respond_to(:plane_take_off)
  end
end
