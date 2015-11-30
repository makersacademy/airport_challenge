require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  before do
    allow(plane).to receive(:not_flying)
    allow(plane).to receive(:flying)
    allow(airport).to receive(:weather?).and_return(:sunny)
  end

  context 'initialize' do

    it 'creates an airport with a default capacity' do
      expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'has a capacity that can be set on initialization' do
      airport = described_class.new(100)
      expect(airport.capacity).to eq 100
    end

  end

  context '#land' do

    it 'lands a plane at the airport and confirm plane is landed' do
      expect(airport.land(plane)).to eq [plane]
    end

    it 'raises an error if the airport is full' do
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'Airport is full'
    end

    it 'won\'t land if weather is stormy' do
      allow(airport).to receive(:weather?).and_return(:stormy)
      expect { airport.land(plane) }.to raise_error 'Weather is stormy'
    end
  end

  context '#takeoff' do

    it 'causes a plane to takeoff' do
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq plane
    end

    it 'raises an error if the airport is empty' do
      expect { airport.takeoff(plane) }.to raise_error 'Airport is empty'
    end

    it 'won\'t takeoff if weather is stormy' do
      airport.land(plane)
      allow(airport).to receive(:weather?).and_return(:stormy)
      expect { airport.takeoff(plane) }.to raise_error 'Weather is stormy'
    end
  end
end
