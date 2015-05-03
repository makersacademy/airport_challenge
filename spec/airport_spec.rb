require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  context 'taking off and landing' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'a plane can land' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      expect(subject.planes.count).to be 1
    end

    it 'a plane is no longer in the airport when it has taken off' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to be_empty
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      allow(subject).to receive(:stormy?) { false }
      capacity = 10
      capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Airport is full"
    end

    it 'a plane cannot land if the weather is stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land plane }.to raise_error "Cannot land during a storm"
    end

    it 'a plane cannot take off if the weather is stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off plane}.to raise_error "Storm brewing"
    end
  end
end