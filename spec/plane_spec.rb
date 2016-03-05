require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#landed' do
    it 'confirms that plane has landed' do
      expect(plane.landed).to eq true
    end
  end
end
