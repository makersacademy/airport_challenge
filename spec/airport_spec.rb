require 'airport'
require 'plane'

describe Airport do
  context 'after a plane has taken off' do
    it 'returns false when has_plane? is called' do
      airport = Airport.new
      plane = Plane.new
      plane.take_off(airport)
      expect(airport).not_to have_plane
    end
  end
  it 'returns "true" when stormy? is called if rand = 0.8' do
    airport = Airport.new
    allow(airport).to receive(:rand).and_return 0.8
    expect(airport).to be_stormy
  end
  it 'returns "false" when stormy? is called if rand = 0.4' do
    airport = Airport.new
    allow(airport).to receive(:rand).and_return(0.4)
    expect(airport).not_to be_stormy
  end
end
