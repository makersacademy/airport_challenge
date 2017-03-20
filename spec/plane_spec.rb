require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#land' do
    it 'no longer flying' do
      plane.land
      expect(plane.flying?).to eq false
    end
  end

  describe '#take_off' do
    it 'flying' do
      plane.take_off
      expect(plane.flying?).to eq true
    end
  end

end
