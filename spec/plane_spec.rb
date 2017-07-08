require 'plane'

describe Plane do
  subject(:plane) { Plane.new }

  describe '#initialize' do
    it 'starts has nil' do
      expect(subject.status).to eq nil
    end
  end

  describe '#flying' do
    it 'shows the plane is already flying' do
      plane.flying
      expect(plane.status).to eq (:flying)
    end
  end

  describe '#landed' do
    it 'shows the plane has already landed' do
      plane.landed
      expect(plane.status).to eq (:landed)
    end
  end
end
