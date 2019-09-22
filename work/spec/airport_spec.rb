require 'airport'
require 'weather'

describe Airport do
  it 'exists!' do
    expect(subject.class).to eq Airport
  end

  describe '#initialize' do
    it 'takes a capacity argument upon initialization' do
      expect(Airport).to respond_to(:new).with(1).argument
    end

    it 'prevents landing when weather is stormy' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.land(plane) }.to raise_error "No landing: Bad weather!"
    end

    it 'prevents taking off when weather is stormy' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.takeoff(plane) }.to raise_error "No taking off: Bad weather!"
    end
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'lands a plane at the airport' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return false
      subject.land(plane)
      expect(subject.plane).to eq @planes
    end

    it 'raises an error when airport is full' do
      allow(subject).to receive(:stormy?).and_return false
      DEFAULT_CAPACITY.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error('Airport full')
    end
  end

  it { is_expected.to respond_to(:takeoff).with(1).argument }

  describe '#takeoff' do
    it 'removes a plane' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return false
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end
  end
end
