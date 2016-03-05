require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#landed' do
    it 'confirms that plane is at airport' do
      expect(plane.at_airport).to eq true
    end
  end
end
