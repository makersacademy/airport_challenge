require "airport"
require "plane"
#require "weather"

#plane = Plane.new

describe Airport do

  describe 'initialization' do
    it 'deafults capacity' do
      plane = double(:plane, land: true)
      allow(subject).to receive(:stormy?).and_return(false)
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lets plane land' do
      plane = double(:plane, land: true)
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.land(plane)).to eq plane
    end

    it 'raises an error when the capacity is full' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = double(:plane, land: true)
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'No landing slots available!'
    end

    it 'raises error and prevents landing when weather is stormy' do
      plane = double(:plane, land: true)
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error "Bad weather conditions!"
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'confirms that the plane is no longer at the airport' do
      expect(subject.planes).to be_empty
    end

    it 'raises error and prevents taking off in stormy weather' do
      plane = double(:plane, land: true)
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off(plane)}.to raise_error "Bad weather conditions!"
    end
  end
end
