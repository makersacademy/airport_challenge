require 'airport'

describe Airport do
  it 'lands a plane' do
    expect(subject).to respond_to(:land)
  end

  it 'takes off a plane' do
    expect(subject).to respond_to(:take_off)
  end

  describe '#take_off' do
    it 'takes off a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAP
  end

  describe 'airport is full' do
    it 'raises error' do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error("Airport is full")
    end
  end

  describe 'no planes in airport' do
    it 'raises error' do
      expect { subject.take_off }.to raise_error("No planes in airport")
    end
  end
end
