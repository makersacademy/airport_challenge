require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }
  it { is_expected.to respond_to :in_airport? }

  let(:plane) { Plane.new }
  let(:weather) { double("Weather") }
  let(:airport) { double("Airport") }

  context 'capacity' do
    it 'has a set default value' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can be set lower at initialization' do
      station = Airport.new(20)
      expect(station.capacity).to eq 20
    end

    it 'can be set higher at initialization' do
      station = Airport.new(100)
      expect(station.capacity).to eq 100
    end

    it 'can be reassigned as needed' do
      subject.adjust_capacity(75)
      expect(subject.capacity).to eq 75
    end

    context 'errors' do
      it 'raises error if reassigned to zero' do
        expect { subject.adjust_capacity(0) }.to raise_error 'invalid capacity'
      end

      it 'raises error if reassigned to negative value' do
        expect { subject.adjust_capacity(-13) }.to raise_error 'invalid capacity'
      end

      it 'raises error if set lower than current plane count' do
        allow(subject.weather).to receive(:stormy?).and_return(false)
        21.times { subject.land(plane) }
        message = 'planes exceeed that capacity!'
        expect { subject.adjust_capacity(20) }.to raise_error message
      end

      it 'raises error if initialzed with zero capacity' do
        expect { Airport.new(0) }.to raise_error 'invalid capacity'
      end

      it 'raises error if initialzed with negative capacity' do
        expect { Airport.new(-4) }.to raise_error 'invalid capacity'
      end
    end
  end

  describe '#land' do
    it 'adds plane to docked planes' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'raises error when stormy' do
      allow(subject.weather).to receive(:stormy?).and_return(true)
      message = 'cannot land in stormy weather'
      expect { subject.land(plane) }.to raise_error message
    end

    it 'raises error when airport is full' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      50.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'airport full'
    end
  end

  describe '#takeoff' do
    it 'removes plane from docked planes' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).not_to include plane
    end

    it 'raises error when stormy' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      allow(subject.weather).to receive(:stormy?).and_return(true)
      message = 'cannot takeoff in stormy weather'
      expect { subject.takeoff(plane) }.to raise_error message
    end

    it 'raises error when no planes docked' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      expect { subject.takeoff(plane) }.to raise_error 'no planes to takeoff'
    end
  end

  describe '#in_airport?' do
    it 'returns true when plane is docked' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.in_airport?(plane)).to eq true
    end

    it 'returns false when plane is not in airport' do
      expect(subject.in_airport?(plane)).to eq false
    end
  end
end
