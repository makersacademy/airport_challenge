require_relative '../lib/plane'

describe Plane do
  subject(:plane) { Plane.new }

  describe '#land' do
    it 'allows an ATC to instruct a pane to land at an airport' do
      expect(plane).to respond_to(:land)
      expect(plane.land).to eq('airport')
    end
  end
end
