require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  context 'initialization' do
    it 'is initialized with default behaviour of flying' do
      expect(plane.landed?).to be false
    end
  end

  context 'landing and takeoff' do
    it 'can land at a specified airport and takeoff' do
      plane.land
      expect(plane.landed?).to eq true
      plane.takeoff
      expect(plane.landed?).to eq false
    end
  end

end
