require 'airport'

describe Airport do
  before do
    allow(subject).to receive(:stormy).and_return false
  end
  
  context '#initialize' do
    it 'has a default capacity and it can change' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  context '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'raises an error if airport is full' do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport is full'
    end

    it 'allows planes to land' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it 'should return landed planes' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq [plane]
    end
  end

  context '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'allows plane to take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq(plane)
    end

    it 'return an error if airport is empty' do
      expect { subject.take_off }.to raise_error 'No plane available'
    end
  end
end
