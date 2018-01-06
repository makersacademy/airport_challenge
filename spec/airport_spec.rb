require 'airport'

describe Airport do
  let(:plane) { double :plane, taken_off: true , landed: false}
  let(:weather) { double :weather, :stormy? => false }
  subject(:airport) { Airport.new(weather) }

  it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'allows capacity to be overidden at request' do
    airport.capacity = 10
    expect(airport.capacity).to eq 10
  end

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
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }. to raise_error 'Airport at full capacity'
    end
    it 'changes plane status to not flying when plane landed' do
      expect(plane).to receive(:landed)
      airport.land(plane)
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
    it 'changes plane status to flying when plane takes off' do
      expect(plane).to receive(:taken_off)
      airport.take_off(plane)
    end
    it 'will not allow plane to take off if it is not already landed at airport' do
      expect { airport.take_off(plane) }.to raise_error "Plane is not at this airport" 
    end
  end
end
