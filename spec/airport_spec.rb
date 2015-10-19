require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  describe '#land' do
    it 'lands a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'raises an error when an airport is full' do
      allow(subject).to receive(:stormy?) { false }
      described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Plane can\'t land. Airport is full!'
    end

    it 'raises an error when a plane makes landing in stormy weather' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error 'Plane can\'t land. Weather is stormy!'
    end
  end

  describe '#take_off' do
    it 'takes off a plane' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'raises an error when a plane tries to take off in stormy weather' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(plane) }.to raise_error 'Plane can\'t take off. Weather is stormy!'
    end

    it 'raises an error when a plane tries to take off from another airport' do
      expect { subject.take_off(plane) }.to raise_error 'Plane can\'t take off. Wrong airport!'
    end
  end
end