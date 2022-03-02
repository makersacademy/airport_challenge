require 'airport'
require 'plane'

describe Airport do
  let(:plane) { Plane.new }

  describe '#new' do
    it 'returns a new airport object' do
      expect(subject).to be_an_instance_of(Airport)
    end

    OVERWRITE_CAPACITY = 50
    subject { described_class.new(OVERWRITE_CAPACITY) }
    it 'is expected to overwrite airport defafault capacity' do
      expect(subject.capacity).to eq OVERWRITE_CAPACITY
    end
  end

  describe '#stormy' do
    context 'respond to stormy?' do
      it { is_expected.to respond_to(:stormy?) }
    end

    it 'returns true or false based on the weather' do
      expect(subject.stormy?).to be(true).or be(false)
    end
  end

  describe '#land' do
    context 'responds to the land method' do
      it { is_expected.to respond_to(:land) }
    end

    context 'responds to one argument' do
      it { is_expected.to respond_to(:land).with(1).argument }
    end

    context 'when the weather is stormy?' do
      it 'prevents landing' do
        message = "Weather is stormy. No landing is allowed!"
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.land(plane) }.to raise_error message
      end
    end

    context 'if the airport is full' do
      it 'raise an exception' do
        message = 'Airport full!'
        Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error message
      end
    end
  end

  describe '#take_off' do
    context 'responds to take_off' do
      it { is_expected.to respond_to(:take_off) }
    end

    context 'responds to one argument' do
      it { is_expected.to respond_to(:take_off).with(1).argument }
    end

    it 'takes off and it confirms that there are 0 planes left in the airport' do
      expect(subject.take_off(plane)).to eq nil
    end

    context 'when the weather is stormy?' do
      it 'prevents to takeoff' do
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.take_off(plane) }.to raise_error
      end
    end
  end
end
