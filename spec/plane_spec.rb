require 'plane'

describe Plane do
  subject(:plane) { Plane.new }

  describe '#initialize' do
    it 'initializes plane as flying' do
      expect(plane).to be_flying
    end
  end
  describe '#landed' do
    before do
      plane.landed
    end
    it 'confirms plane is no longer flying' do
      expect(plane).not_to be_flying
    end
    it 'will raise error if called on non flying plane' do
      expect { plane.landed }.to raise_error "Plane is already grounded"
    end
  end
  describe '#take_off' do
    it 'confirms plane is flying' do
      plane.landed
      plane.taken_off
      expect(plane).to be_flying
    end
    it 'will raise error if called on non flying plane' do
      expect { plane.taken_off }.to raise_error "Plane is already in the air"
    end
  end
end
