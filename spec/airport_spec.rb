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

  describe 'landing plane' do

    it { is_expected.to respond_to(:land).with(1).argument }

    before do
      allow(subject).to receive(:stormy?).and_return false
    end

      it 'lands a plane and confirms landing' do
        plane = double("plane", :in_air? => true, :plane_landed => subject)
        expect(subject.land(plane)).to eq plane
      end

      it 'doesn\'t allow landing if the airport is full' do
        subject.capacity.times do
          plane = double("plane", :in_air? => true, :plane_landed => subject)
          subject.land(plane)
        end
        expect{ subject.land(plane) }.to raise_error "Airport Full"
      end

      it 'doesn\'t allow landing if weather is stormy' do
        plane = double("plane", :in_air? => true)
        allow(subject).to receive(:stormy?).and_return true
        message = "Cannot land in stormy conditions"
        expect{ subject.land(plane) }.to raise_error message
      end
  end

  describe 'taking off' do

    it { is_expected.to respond_to(:take_off).with(1).argument }

    before do
      allow(subject).to receive(:stormy?).and_return false
    end

    it 'a plane can take off' do
      plane = double("plane", :in_air? => false, :plane_take_off => subject)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'no longer contains a plane if it has taken off' do
      plane = double("plane", :in_air? => false, :at_airport => subject, :plane_take_off => subject)
      subject.take_off(plane)
      expect(subject.planes_landed).not_to include plane
    end

    it 'doesn\'t allow taking off if weather is stormy' do
      plane = double("plane", :in_air? => false)
      allow(subject).to receive(:stormy?).and_return true
      message = "Cannot take off in stormy conditions"
      expect{ subject.take_off(plane) }.to raise_error
    end

  end
end
