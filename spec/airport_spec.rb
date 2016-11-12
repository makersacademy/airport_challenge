require 'airport'
require 'plane'
require 'weather'

describe Airport do

  subject(:airport) {described_class.new}
  let(:plane) {double :plane}

  describe '#status' do
    it 'shows the status of a landed plane' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed).and_return(true)
      airport.land plane
      expect(airport.status plane).to eq "Landed"
    end

    it 'shows the status of a plane in the air' do
      allow(plane).to receive_message_chain(:take_off)
      allow(plane).to receive(:landed).and_return(false)
      airport.take_off plane
      expect(airport.status plane).to eq "In the air"
    end
  end

  describe '#land' do
    it 'lands a plane' do
      expect(plane).to receive(:land)
      airport.land plane
    end
    it 'puts a landed plane in the airport' do
      allow(plane).to receive(:land)
      airport.land plane
      expect(airport.planes).to include plane
    end
  end

  describe '#take_off' do
    it 'takes off a plane' do
      expect(plane).to receive(:take_off)
      airport.take_off plane
    end
    it 'removes taken off planes from the airport' do
      allow(plane).to receive(:take_off)
      airport.planes << plane
      airport.take_off plane
      expect(airport.planes).not_to include(plane)
    end
  end

end
