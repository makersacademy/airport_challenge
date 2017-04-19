require 'airport'

describe Airport do
  before do
    allow(plane).to receive(:landed?)
    allow(plane).to receive(:instance_of?) { true }
    allow(airport.weather).to receive(:stormy?).and_return(false)
  end

  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }
  subject(:airport) { described_class.new }

  context 'capacity' do

    it 'has a set default value' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can be set adjusted at initialization' do
      expect(described_class.new(20).capacity).to eq 20
    end

    it 'can be reassigned as needed' do
      airport.adjust_capacity(75)
      expect(airport.capacity).to eq 75
    end

    context 'errors' do
      it 'if reassigned to zero' do
        expect { airport.adjust_capacity(0) }.to raise_error 'Invalid capacity'
      end

      it 'if reassigned to negative value' do
        message = 'Invalid capacity'
        expect { airport.adjust_capacity(-13) }.to raise_error message
      end

      it 'if set lower than current plane count' do
        allow(airport).to receive(:in_airport?).and_return(false)
        allow(plane).to receive(:land).and_return(plane)
        21.times { airport.land(plane) }
        message = 'Planes already exceeed that capacity!'
        expect { airport.adjust_capacity(20) }.to raise_error message
      end

      it 'if initialzed with zero capacity' do
        expect { described_class.new(0) }.to raise_error 'Invalid capacity'
      end

      it 'if initialzed with negative capacity' do
        expect { described_class.new(-4) }.to raise_error 'Invalid capacity'
      end
    end
  end

  describe '#land' do
    before do
      allow(plane).to receive(:land)
    end

    it 'instructs plane to land successfully' do
      expect(airport.land(plane)).to eq [plane]
    end

    it 'adds plane to docked planes' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    context 'errors' do
      it 'when stormy' do
        allow(airport.weather).to receive(:stormy?).and_return(true)
        message = 'Cannot land in stormy weather'
        expect { airport.land(plane) }.to raise_error message
      end

      it 'when airport is full' do
        allow(airport).to receive(:in_airport?).and_return(false)
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error 'Airport full'
      end

      it 'when plane is already landed there' do
        airport.land(plane)
        message = 'Plane is already in the airport'
        expect { airport.land(plane) }.to raise_error message
      end

      it 'when trying to land a landed plane elsewhere' do
        gatwick, heathrow = described_class.new, described_class.new
        allow(gatwick.weather).to receive(:stormy?).and_return(false)
        allow(heathrow.weather).to receive(:stormy?).and_return(false)
        gatwick.land(plane)
        message = 'Plane already landed elsewhere!'
        allow(plane).to receive(:landed?).and_return(true)
        expect { heathrow.land(plane) }.to raise_error message
      end

      it 'if passed string' do
        expect { airport.land('plane') }.to raise_error 'Invalid plane'
      end

      it 'if passed an integer' do
        expect { airport.land(1) }.to raise_error 'Invalid plane'
      end

      it 'if passed the wrong class' do
        expect { airport.land(Airport)}.to raise_error 'Invalid plane'
      end
    end
  end

  describe '#takeoff' do
    before do
      allow(plane).to receive(:land).and_return(plane)
      allow(plane).to receive(:takeoff).and_return(plane)
    end

    it 'removes plane from docked planes' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.planes).not_to include plane
    end

    it 'raises error when stormy' do
      airport.land(plane)
      allow(airport.weather).to receive(:stormy?).and_return(true)
      message = 'Cannot takeoff in stormy weather'
      expect { airport.takeoff(plane) }.to raise_error message
    end

    it 'raises error when no planes docked' do
      expect { airport.takeoff(plane) }.to raise_error 'No planes to takeoff'
    end

    it 'raises error when plane is not in the airport' do
      message = 'Plane is not in the airport'
      allow(airport).to receive(:empty?).and_return(false)
      expect { airport.takeoff(plane) }.to raise_error message
    end
  end
end
