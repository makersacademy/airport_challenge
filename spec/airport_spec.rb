require 'airport'

describe Airport do
  let(:plane) { double :plane, taken_off: true, landed: false }
  let(:weather) { double :weather, :stormy? => false }
  subject(:airport) { Airport.new(weather) }

  it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'allows capacity to be overidden at request' do
    airport.capacity = 10
    expect(airport.capacity).to eq 10
  end

  describe '#land' do
    it 'stores plane when landed' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end
    it 'checks weather status before allowing plane to land' do
      expect(weather).to receive(:stormy?)
      airport.land(plane)
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

  describe '#take_off' do
    context 'when plane has already landed at airport' do
      before do
        airport.land(plane)
        airport.take_off(plane)
      end
      it 'removes plane from airport' do
        expect(airport.planes).not_to include plane
      end
      it 'removes correct plane from aiport' do
        plane2 = double(:plane, :landed => false)
        airport.land(plane2)
        expect(airport.planes).to eq [plane2]
      end
    end
    context 'when plane is not landed at airport' do
      it 'will not allow plane to take off if it is not already landed at airport' do
        expect { airport.take_off(plane) }.to raise_error "Plane is not at this airport"
      end
      it 'changes plane status to flying when plane takes off' do
        airport.land(plane)
        expect(plane).to receive(:taken_off)
        airport.take_off(plane)
      end
    end
    context 'when weather is stormy' do
      before do
        airport.land(plane)
      end
      it 'checks weather status before allowing a plane to take_off' do
        expect(weather).to receive(:stormy?)
        airport.take_off(plane)
      end
      it 'will not allow plane to take off if weather stormy - error will be thrown' do
        allow(weather).to receive(:stormy?).and_return(true)
        expect { airport.take_off(plane) }.to raise_error 'Unable to take off - weather is stormy'
      end
    end
  end
end
