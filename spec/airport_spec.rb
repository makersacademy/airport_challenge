require "airport"
require "weather"

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
    it 'lets plane land' do
      plane = double(:plane, land: true)
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.land(plane)).to eq plane
    end

    it 'raises an error when the capacity is full' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = double(:plane, land: true)
      subject.capacity.times { subject.land(plane) }
      message = 'No landing slots available!'
      expect { subject.land(plane) }.to raise_error message
    end

    it 'raises error and prevents landing when weather is stormy' do
      plane = double(:plane, land: true)
      allow(subject).to receive(:stormy?).and_return(true)
      message = "Bad weather conditions!"
      expect { subject.land(plane) }.to raise_error message
    end
  end

  describe '#take_off' do
    it 'confirms that the plane is no longer at the airport' do
      expect(subject.planes).to be_empty
    end

    it 'raises error and prevents taking off in stormy weather' do
      plane = double(:plane, land: true)
      allow(subject).to receive(:stormy?).and_return(true)
      message = "Bad weather conditions!"
      expect { subject.take_off(plane)}.to raise_error message
    end
  end
end
