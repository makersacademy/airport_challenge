require 'airport'
require 'plane'

describe Airport do

  subject(:airport) {described_class.new}
  let(:plane) {double :plane}

  describe '#land' do
    it 'lands a plane' do
      expect(plane).to receive(:land)
      airport.land plane
    end
    it 'holds landed planes' do
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
    it 'should not hold any planes that have taken off' do
      allow(plane).to receive(:take_off)
      airport.planes << plane
      airport.take_off plane
      expect(airport.planes).not_to include(plane)
    end
  end

end
