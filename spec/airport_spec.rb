require 'airport'
require 'plane'

describe Airport do
  it 'plane lands' do
    expect(subject).to respond_to(:land)
  end

  it 'confirms plane has taken off' do
    plane = Plane.new
    subject.planes << plane
    subject.take_off
    expect(subject.planes.length).to eq 0
  end

  describe '#take_off' do
    it 'plane takes off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'raises and error when there are no planes at the airport to take off' do
      expect { subject.take_off }.to raise_error 'take off failed: there are no planes at the airport'
    end
  end
  
  it 'airport has a default capacity' do
    subject.capacity
    Airport::DEFAULT_CAPACITY
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
    it 'raises an error when at capacity' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land Plane.new }.to raise_error 'landing prohibited: airport is full'
    end
  end
end