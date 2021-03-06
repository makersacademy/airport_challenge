require 'plane'
require 'airport'
require 'weather'

describe Plane do
  let(:plane) { Plane.new }
  let(:weather) { Weather.new(0, 2, 10) }
  let(:airport) { Airport.new('Schiphol', 13, weather, SafetyBreach.new([1])) }

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
