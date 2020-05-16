require_relative '../lib/plane'

describe Plane do
  subject(:plane) { Plane.new }

  describe '#land' do
    it 'allows an ATC to instruct a pane to land at an airport' do
      expect(plane).to respond_to(:land)
      expect(plane.land).to eq('airport')
    end
  end

  describe '#take_off' do
    it 'allows an ATC to instruct a plane to take off' do
      expect(plane.take_off).to eq('air')
    end
  end
end
