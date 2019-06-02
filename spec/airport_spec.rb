require 'airport'
require 'plane'

describe Airport do

  it 'plane lands at the airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'plane is no longer at the airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to eq [plane]
  end

  it 'airport has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#take_off' do

    it 'plane takes off from airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'raises an error when the airport is empty' do
      expect { subject.take_off }.to raise_error 'Airport empty'
    end
  end

  describe '#land' do

    it 'raises an error when the airport is full' do
      subject.capacity.times { subject.land(Plane.new) }   
      expect { subject.land(Plane.new) }.to raise_error 'Airport full'
    end
  end
end
