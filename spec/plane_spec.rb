require 'plane'

describe Plane do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe '#landed' do
    it 'returns true when a plane has landed' do
      subject.land(airport)
      expect(subject.landed).to eq true
    end
  end

  describe '#take_off' do

    before(:example) { plane.take_off(airport) }

    it 'confirms the plane has taken off' do
      expect(plane.landed).to eq false
    end

    it 'confirms the plane has left the airport' do
      expect(airport.plane).not_to eq plane
    end

  end

end
