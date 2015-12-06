require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  before do
    plane.land
  end

  describe '#take_off' do
    it 'should make a plane take off' do
      plane.take_off
      expect(plane.in_airport_status).to eq false
    end

    it 'raises an error if already flying' do
      plane.take_off
      expect { plane.take_off }.to raise_error "Plane is already flying"
    end
  end

  describe '#land' do
    it 'should land a plane' do
      expect(plane.in_airport_status).to eq true
    end
  end

  describe '#landed?' do
    it 'should confirm that a plane has landed' do
      expect(plane.in_airport_status).to eq true
    end
  end

  describe '#in_airport?' do
    it 'should confirm that the plane is no longer in the airport' do
      plane.take_off
      expect(plane.in_airport_status).to eq false
    end
  end

end
