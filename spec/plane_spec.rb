require 'plane'
require 'airport'

describe Plane do
  subject (:plane) { Plane.new }
  let (:airport) { Airport.new }
  let (:plane_take_off) do
    airport.land(plane)
    airport.take_off(plane)
  end

  describe 'initialisation' do
    it 'is not in flight' do
      expect(plane).to_not be_in_flight
    end
  end

  describe '#in_flight' do
    it { is_expected.to respond_to(:in_flight?) }
  end

  describe '#land' do
    it { is_expected.to respond_to(:land) }

    it 'is a landed plane' do
      plane_take_off
      airport.land(plane)
      expect(plane).to_not be_in_flight
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'is a plane in flight' do
      plane_take_off
      expect(plane).to be_in_flight
    end
  end
end
