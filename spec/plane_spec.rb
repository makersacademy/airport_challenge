require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#land' do
    it 'can land at airport' do
      expect(plane.land(Airport.new))
    end

    it 'confirms when lands' do
      expect(plane.land(Airport.new)).to eq true
    end
  end
end
