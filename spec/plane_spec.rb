require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#flying?' do
    it 'confirms plane is flying' do
      expect(plane.flying?).to be true
    end
  end
end
