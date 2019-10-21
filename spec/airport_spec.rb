require 'airport.rb'
require 'plane.rb'

describe Airport do
  subject(:airport) { described_class.new(20) }

  describe '#land' do
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end
    it 'lands a plane' do
      allow(airport).to receive(:stormy?).and_return false
      plane = Plane.new
      expect(airport.land(plane)).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
    it 'plane takes off' do
      allow(airport).to receive(:stormy?).and_return false
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eq [plane]
    end
  end


  it 'raises an error when asked to land a plane when stormy' do
    allow(airport).to receive(:stormy?).and_return true
    plane = Plane.new
    expect { airport.land(plane) }.to raise_error "cannot land the plane: weather is stormy!"
  end

  it 'raises an error when asked to take off when stormy' do
    allow(airport).to receive(:stormy?).and_return true
    plane = Plane.new
    expect { airport.take_off(plane) }.to raise_error "cannot take off: weather is stormy!"
  end

  it 'raises an error when asked to land at max capacity' do
    allow(airport).to receive(:stormy?).and_return false
    plane = Plane.new
    20.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error "cannot land the plane: airport at capacity!"
  end

  it 'overwrite default capacity' do
    expect(subject.capacity = 30).to eq 30
  end
end
