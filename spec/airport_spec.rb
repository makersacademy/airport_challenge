require 'airport'

describe Airport do
  let(:plane) { Plane.new('concord', 'air') }
  let(:airport) { Airport.new('heathrow', [], 1) }

  # test redundant?

  describe 'full?' do
    it 'returns true if hangar is at capacity' do
      airport.hangar << plane
      expect(airport.full?).to eq(true)
    end
  end

end
