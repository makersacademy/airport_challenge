require 'airport'

describe Airport do

  describe 'initialize' do

    it 'creates an airport with a default capacity' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'has a capacity that can be set on initialization' do
      airport = described_class.new(100)
      expect(airport.capacity).to eq 100
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands a plane at the airport' do
      plane = double(:plane)
      expect(subject.land(plane)).to eq [plane]
    end

    it 'raises an error if the airport is full' do
      plane = double(:plane)
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport is full!'
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff) }

    it 'causes a plane to takeoff' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.takeoff).to eq plane
    end

    it 'raises an error if the airport is empty' do
      expect { subject.takeoff }.to raise_error 'Airport is empty!'
    end
  end
end
