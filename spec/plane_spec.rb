require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { Airport.new }

  before { plane.land_at(airport) }

  describe '#land' do
    it 'lands the plane' do
      expect(plane.landed?).to eq true
    end

    it 'cannot be landed if already landed' do
      expect { plane.land_at(airport) }.to raise_error("Plane already landed!")
    end
  end

  describe '#take_off' do
    it 'launches the plane' do
      plane.take_off
      expect(plane.landed?).to eq false
    end

    it 'does not take off if already airborne' do
      plane.take_off
      expect { plane.take_off }.to raise_error("Plane already airborne!")
    end
  end

end
