require 'airport'

describe Airport do
  let(:plane) { double :plane }
  let(:weather) { double :weather, :stormy? => false }
  subject(:airport) { Airport.new(weather) }

  it { is_expected.to respond_to(:land).with(1).argument }
  describe '#land' do
    it 'stores plane when landed' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end
    it 'will not allow plane to land in stormy weather - error will be thrown' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error 'Unable to land - weather is stormy'
    end
    it 'raises error when full' do
      airport.land(plane)
      expect { airport.land(plane) }. to raise_error 'Airport at full capacity'
    end
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }
  describe '#take_off' do
    it 'removes plane from airport' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end
    it 'will not allow plane to take off if weather stormy - error will be thrown' do
      airport.land(plane)
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane) }.to raise_error 'Unable to take off - weather is stormy'
    end
  end
end
