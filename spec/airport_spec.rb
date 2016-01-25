require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:Airport) {described_class.new(weather)}
  let(:plane) {double :plane}
  let(:weather) { Weather.new }

  describe '#initialize' do
    it 'initialize should set a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  context 'landing plane' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands a plane and confirms landing' do
      plane = double("plane", :in_air? => true, :plane_landed => subject)
      allow(subject).to receive(:stormy?).and_return false
      expect(subject.land(plane)).to eq plane
    end

    it 'doesn\'t allow landing if the airport is full' do
      allow(subject).to receive(:stormy?).and_return false
      subject.capacity.times do
        plane = double("plane", :in_air? => true, :plane_landed => subject)
        subject.land(plane)
      end
      expect{ subject.land(plane) }.to raise_error "Airport Full"
    end

    it 'doesn\'t allow landing if weather is stormy' do
      plane = double("plane", :in_air? => true)
      allow(subject).to receive(:stormy?).and_return true
      expect{ subject.land(plane) }.to raise_error "Cannot land in stormy conditions"
    end
  end

  context 'taking off' do

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'a plane can take off' do

      plane = double("plane", :in_air? => false, :plane_take_off => subject)
      allow(subject).to receive(:stormy?).and_return false
      expect(subject.take_off(plane)).to eq plane
    end
    it 'doesn\'t allow taking off if weather is stormy' do
      plane = double("plane", :in_air? => false)
      allow(subject).to receive(:stormy?).and_return true
      expect{ subject.take_off(plane) }.to raise_error "Cannot take off in stormy conditions"
    end

    it 'no longer contains a plane if it has taken off' do
      plane = double("plane", :in_air? => false, :at_airport => subject, :plane_take_off => subject)
      allow(subject).to receive(:stormy?).and_return false
      subject.take_off(plane)
      expect(subject.planes_landed).not_to include plane
    end
  end
end
