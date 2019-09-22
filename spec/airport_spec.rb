require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double :plane }
  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'lands a plane at the airport' do
      airport = Airport.new
      expect(airport.land(plane)).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'confirms that plane has departed from airport' do
      airport = Airport.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "Plane is no longer at the airport"
    end
  end
end
