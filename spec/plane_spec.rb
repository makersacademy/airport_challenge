require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { Airport.new }

  describe '#land_at' do
    it 'lands the plane' do
      plane.land_at(airport)
      expect(plane.landed?).to eq true
    end
  end

  describe '#take_off' do
    it 'launches the plane' do
      plane.take_off
      expect(plane.landed?).to eq false
    end
  end

end
