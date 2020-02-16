require 'airport.rb'

describe Airport do
  let(:plane) { Plane.new }
  let(:plane2) { Plane.new }
  subject(:airport) { described_class.new(10) }

  describe '#land' do
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'lands a plane' do
      allow(airport).to receive(:stormy?).and_return false
      plane.in_flight
      expect(airport.land(plane)).to include(plane)
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'plane takes off' do
      allow(airport).to receive(:stormy?).and_return false
      plane.in_flight
      airport.land(plane)
      expect(airport.take_off(plane)).to eq(plane)
    end
  end

  describe '#stormy' do
    it 'stormy returns true' do
      allow(airport).to receive(:stormy?).and_return true
      expect(airport.stormy?).to eq(true)
    end

    it 'stormy returns false' do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport.stormy?).to eq(false)
    end

    it 'raises an error when asked to land a plane when stormy' do
      allow(airport).to receive(:stormy?).and_return true
      plane.in_flight
      expect { airport.land(plane) }.to raise_error "cannot land the plane: weather is stormy!"
    end

    it 'raises an error when asked to take off when stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.take_off(plane) }.to raise_error "cannot take off: weather is stormy!"
    end
  end

  describe '#capacity' do
    it 'raises an error when asked to land at max capacity' do
      allow(airport).to receive(:stormy?).and_return false
      subject.capacity = 1
      airport.land(plane)
      expect { airport.land(plane2) }.to raise_error "cannot land the plane: airport at capacity!"
    end

    it 'overwrite default capacity' do
      expect(subject.capacity = 30).to eq 30
    end
  end
end
