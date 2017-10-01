require 'airport'
require 'aeroplane'
require 'weather'

describe Airport do

  let(:subject)   { Airport.new }
  let(:plane)     { Aeroplane.new }
  let(:weather)   { Weather.new }

  it 'has a default capacity of 10' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'take_off' do
    it 'allows a plane to take off' do
      subject.land(plane)
      allow(subject.weather).to receive(:stormy?).and_return false
      subject.take_off(plane)
      expect(plane.landed).to be false
    end
    it 'will not release a plane when airport is empty' do
      expect { subject.take_off(plane) }.to raise_error 'Airport empty!'
    end
    it 'removes plane from array once taken off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include plane
    end
    it 'raises error if the plane is already flying' do
      subject.land(plane)
      expect { subject.take_off(Aeroplane.new) }.to raise_error 'This plane is on flight!'
    end
    it 'raises a stormy weather error' do
      allow(subject.weather).to receive(:stormy?).and_return true
      expect { subject.take_off(plane) }.to raise_error 'Plane cannot take off due to storm'
    end
  end

  describe 'land' do
    it 'allows a plane to land in the airport' do
      subject.land(plane)
      expect(plane.landed).to be true
    end
    it 'will not allow planes to land when airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Aeroplane.new) }
      expect { subject.land(Aeroplane.new) }.to raise_error 'Airport full!'
    end
    it 'keeps track of the plane once landed' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end
    it 'raises an error if plane has already landed' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'This plane has already landed!'
    end
  end
end
