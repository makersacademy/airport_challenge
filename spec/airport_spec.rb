require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to :planes }
  it { is_expected.to respond_to(:take_off) }

  let (:plane) { Plane.new }

  describe '#initialize' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#capacity' do
    it 'has variable capacity' do
      subject.capacity = 50
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport full'
    end
  end

  describe '#land' do
    it 'raises an error when full' do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport full'
    end

    it 'instructs a plane to land' do
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#planes' do
    it 'returns landed planes' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'removes a plane' do
      subject.land(plane)
      subject.take_off
      expect(subject.planes).not_to include(plane)
    end
  end
end
