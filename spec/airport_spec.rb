require 'airport'
require 'plane'

describe Airport do
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'removes plane from airport after take off' do
    allow(subject).to receive(:weather) { "sunny" }
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end

  it 'returns a message to say plane has taken-off' do
    allow(subject).to receive(:weather) { "sunny" }
    subject.land(plane)
    expect(subject.take_off(plane)).to include "#{plane} has taken off"
  end

  it { is_expected.to respond_to(:planes) }

  it 'allows planes to land' do
    allow(subject).to receive(:weather) { "sunny" }
    expect(subject.land(plane)).to eq [plane]
  end

  it 'adds landed plane to planes array' do
    allow(subject).to receive(:weather) { "sunny" }
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it 'has default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'allows controller to check the weather' do
    expect(subject).to respond_to(:weather)
  end

  describe '#weather' do
    it 'only allows sunny or stormy weather' do
      expect(subject.weather).to satisfy { "sunny" } || satisfy { "stormy" }
    end

    it 'prevents take off when stormy' do
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.take_off(plane) }.to raise_error "Weather too stormy for take-off"
    end

    it 'prevents landing when stormy' do
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.land(plane) }.to raise_error "Weather too stormy for landing"
    end
  end

  describe '#land' do
    it 'raises an error when the airport is full' do
      allow(subject).to receive(:weather) { "sunny" }
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport full'
    end
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      airport = Airport.new(10)
      allow(airport).to receive(:weather) { "sunny" }
      10.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error 'Airport full'
    end
  end
end
