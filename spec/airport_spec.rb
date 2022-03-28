require 'airport'

describe Airport do
  subject(:airport) { airport = Airport.new(10) }
  it 'can instruct plane to land' do
    expect(airport).to respond_to(:land_plane)
  end

  it 'can instruct plane to take off' do
    expect(airport).to respond_to(:plane_take_off)
  end
  
  it 'does not allow planes to land when at capacity' do
    10.times do
      airport.land_plane(:plane)
    end
    expect { airport.land_plane(:plane).to raise_error 'No space at airport for plane to land' }
  end
end
