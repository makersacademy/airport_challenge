require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#taking_off' do
    it 'cannot take off if already flying' do
      message = "Plane cannot take off, already in air!"
      expect { plane.taking_off }.to raise_error message
    end
  end

  describe '#landing' do
    it 'changes flying status to false' do
      expect(plane.landing).to eq false
    end

    it 'raises error if already landed' do
      plane.landing
      expect { plane.landing }.to raise_error "Plane cannot land again"
    end
  end
end
