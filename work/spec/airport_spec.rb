require 'airport'
require 'weather'

describe Airport do
  
  let(:plane) { double :plane }

  it 'exists!' do
    expect(subject.class).to eq Airport
  end

  describe '#initialize' do
    it 'takes a capacity argument upon initialization' do
      expect(Airport).to respond_to(:new).with(1).argument
    end

    it 'prevents landing when weather is stormy' do
      allow(plane).to receive(:flying).and_return true
      allow(subject).to receive(:stormy?).and_return true
      message = "No landing: Bad weather!"
      expect { subject.land(plane) }.to raise_error message
    end

    it 'prevents taking off when weather is stormy' do
      allow(plane).to receive(:flying).and_return false
      allow(subject).to receive(:stormy?).and_return true
      message = "No taking off: Bad weather!"
      expect { subject.takeoff(plane) }.to raise_error 
    end
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do

    before do
      allow(subject).to receive(:stormy?).and_return false
    end

    it 'instructs plane to land' do  
      plane = Plane.new
      expect(subject).to receive(:land).with(plane)
      subject.land(plane)
    end

    it 'has the plane after it lands' do
      plane = Plane.new
      allow(subject).to receive(:land).with(plane)
      expect(subject.plane).to eq @planes
    end

    it 'raises an error when airport is full' do
      DEFAULT_CAPACITY.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error('Airport full')
    end
  end

  it { is_expected.to respond_to(:takeoff).with(1).argument }

  describe '#takeoff' do

    before do
      allow(subject).to receive(:stormy?).and_return false
    end

    it 'removes a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end
  end
end
