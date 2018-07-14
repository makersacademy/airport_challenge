require 'airport'
require 'plane'

describe Airport do

  describe '#initialize' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows different capacity on initialization' do
      airport = Airport.new(60)
      expect(airport.capacity).to eq 60
    end
  end

  describe '#stormy?' do
    it { is_expected.to respond_to :stormy? }
  end

  describe '#takeoff' do

    context 'when not stormy' do
      before do
        allow(subject).to receive(:stormy?) { false }
      end
      it { is_expected.to respond_to :takeoff }

      it 'loses a plane from the landing bay when plane takesoff' do
        airport = Airport.new
        airport.landing(Plane.new)
        expect(airport.takeoff).to eq 'successful takeoff'
      end

      it 'raises an error when the airport has no planes' do
        airport = Airport.new
        expect { airport.takeoff }.to raise_error 'No planes available'
      end
    end

    context 'when stormy' do
      before do
        allow(subject).to receive(:stormy?) { true }
      end
      it 'raises an error when the weather is stormy' do
        airport = Airport.new
        airport.landing(Plane.new)
        expect { airport.takeoff }.to raise_error 'Weather is stormy'
      end
    end

  end

  describe "#landing" do
    context 'when not stormy' do
      before do
        allow(subject).to receive(:stormy?) { false }
      end
      it { is_expected.to respond_to(:landing).with(1).argument }

      it 'adds a plane to the landing bay when plane lands' do
        plane = Plane.new
        airport = Airport.new
        airport.landing(plane)
        expect(airport.landing(plane)).to eq 'successful landing'
      end

      it 'raises an error when the airport is full' do
        subject.capacity.times { subject.landing(Plane.new) }
        expect { subject.landing(Plane.new) }.to raise_error 'No bays available'
      end
    end

    context 'when stormy' do
      before do
        allow(subject).to receive(:stormy?) { true }
      end

      it 'raises an error when the weather is stormy' do
        airport = Airport.new
        expect { airport.landing(Plane.new) }.to raise_error 'Weather is stormy'
      end
    end

  end

end
