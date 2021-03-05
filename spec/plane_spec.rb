require 'plane'
require 'airport'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new('Schiphol') }

  describe 'land' do
    it { is_expected.to respond_to :land }
    it 'should land a plane' do
      expect(subject.land(airport)).to eq airport
    end
  end

  describe 'take_off' do
    it { is_expected.to respond_to :take_off }
    it 'should fly away from the airport' do
      plane.land(airport)
      expect(plane.take_off).to eq nil
    end
  end

end
