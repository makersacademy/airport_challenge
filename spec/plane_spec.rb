require 'plane'

describe Plane do
  subject { described_class.new(airport) }
  let(:airport) { double :airport }
  let(:in_flight_plane) { described_class.new }

  # FIXME: cannot to test for initialization without attr_reader
  # describe '#initialize' do => use new built-in methods
  #   # it { is_expected.to respond_to(:airport) }
  #   it { is_expected.to have_attributes(:airport => airport) }
  #
  #   it 'initializes with the airport it is stationed at' do
  #     # expect(subject.airport).to eq airport
  #   end
  # TODO: test that plane is not in_flight by default
  # end

  describe '#land_at' do
    let(:destination) { double :airport }
    it { is_expected.to respond_to(:land_at).with(1).argument }

    context 'when the plane is not in flight' do
      it 'raises an exception' do
        expect{ subject.land_at destination }.to raise_exception("Plane is not in flight!")
      end
    end

    context 'when the plane is in flight' do
      it 'lands at an airport and confirms' do
        allow(destination).to receive(:stormy?) { false }
        expect(destination).to receive(:inbound).with(in_flight_plane)
        expect(in_flight_plane.land_at destination).to be_truthy
      end

      it 'raises exception and does not land if destination weather is stormy' do
        allow(destination).to receive(:stormy?) { true }
        expect{ in_flight_plane.land_at destination }.to raise_exception("Unable to land plane in stormy weather")
        expect(in_flight_plane.in_flight?).to be_truthy
      end

      # TODO: test that landing sets location
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(0).arguments }

    context 'when the plane is in flight' do

      it 'raises an exception' do
        expect{ in_flight_plane.take_off }.to raise_exception("Plane is in flight!")
      end
    end

    context 'when the plane is stationed at an airport' do
      it 'takes off from the airport and confirms' do
        allow(airport).to receive(:stormy?) { false }
        expect(airport).to receive(:outbound).with(subject)
        expect(subject.take_off).to be_truthy
      end

      it 'raises an exception and does not take off if weather is stormy' do
        allow(airport).to receive(:stormy?) { true }
        expect{ subject.take_off }.to raise_exception("Unable to take off in stormy weather")
        # TODO: expect subject location to remain airport
      end

      it 'sets plane state to in_flight' do
        # TODO: return in_flight status
      end
    end
  end

  describe '#location' do
    context 'when plane is stationed at an airport' do
      it 'returns the airport code' do
        allow(airport).to receive(:code) { :LAX }
        expect(subject.location).to eq :LAX
      end
    end

    context 'when a plane is in flight' do
      it 'returns nil' do
        allow(subject).to receive(:in_flight?) { true }
        expect(subject.location).to be_nil
      end
    end
  end

  describe '#in_flight?' do
    it { is_expected.to respond_to(:in_flight?) }

    context 'when the plane is stationed at an airport' do
      it 'returns false' do
        # Plane is not in flight by default because it is associated with
        # an airport at initialization
        expect(subject.in_flight?).to be_falsy
      end
    end

    context 'when the plane has taken off' do
      it 'returns true' do
        allow(airport).to receive(:stormy?) { false }
        allow(airport).to receive(:outbound) { subject }
        subject.take_off
        expect(subject.in_flight?).to be_truthy
      end
    end
  end
end
