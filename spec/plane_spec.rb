require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  context 'initialization' do
    it 'is initialized with default behaviour of flying' do
      expect(plane.landed?).to be false
    end
  end

  context 'landing and takeoff' do
    it 'can land at a airport' do
      plane.land
      expect(plane.landed?).to be true
    end

    it 'can takeoff from an airport' do
      plane.takeoff
      expect(plane.landed?).to be false
    end
  end
end
