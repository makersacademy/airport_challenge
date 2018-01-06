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
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }
  describe '#take_off' do
    it 'removes plane from airport' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end
    it 'will not allow plane to take off if weather stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      airport.land(plane)
      expect { airport.take_off(plane) }.to raise_error 'Unable to take off - weather is stormy'
    end
  end
end
