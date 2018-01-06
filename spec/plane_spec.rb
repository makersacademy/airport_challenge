require 'plane'

describe Plane do
  subject(:plane) { Plane.new }

  describe '#initialize' do
    it 'initializes plane as flying' do
      expect(plane).to be_flying
    end
  end
  describe '#landed' do
    it 'confirms plane is no longer flying' do
      plane.landed
      expect(plane).not_to be_flying
    end
    it 'will raise error if called on non flying plane' do
      plane.landed
      expect { plane.landed }.to raise_error "Plane is already grounded"
    end
  end
  describe '#take_off' do
    it 'confirms plane is flying' do
      plane.taken_off
      expect(plane).to be_flying
    end
  end
end
