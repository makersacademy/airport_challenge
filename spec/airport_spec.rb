require 'airport'
require 'plane'

describe Airport do
  it 'plane lands' do
    expect(subject).to respond_to(:land)
  end

  it 'plane takes off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'confirms plane has taken off' do
    plane = Plane.new
    subject.planes << plane
    subject.take_off(plane)
    expect(subject.planes.length).to eq 0
  end

  describe '#land' do
    it 'raises an error when at capacity' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land Plane.new }.to raise_error 'landing prohibited: airport is full'
    end
  end

  it 'confirms airport has a default capacity' do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  describe '#initialize' do
    it 'has a variable capacity' do
      airport = Airport.new(17)
      described_class::DEFAULT_CAPACITY.times { subject.land(Plane.new) } #described class a useful bit of RSpec syntax to avoid having to rename all classes in tests if class names change
      expect { subject.land Plane.new }.to raise_error 'landing prohibited: airport is full'
    end
  end

end