require 'plane'
require 'airport'

describe Plane do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'takes an airport as an argument and lands at that airport' do
      airport = Airport.new
      subject.land(airport)
      expect(airport.planes.last).to eq subject
    end
  end
end
