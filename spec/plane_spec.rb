require 'plane'

describe Plane do
  let(:airport) { double(:airport, :stormy? => false) }
  subject(:docked_plane) { described_class.new(airport) }
  let(:in_flight_plane) { described_class.new }


  # describe '#initialize' do => use new built-in methods
  #   # it { is_expected.to respond_to(:airport) }
  #   it { is_expected.to have_attributes(:airport => airport) }
  #
  #   it 'initializes with the airport it is stationed at' do
  #     # expect(docked_plane.airport).to eq airport
  #   end
  # TODO: test that plane is not in_flight by default
  # end

  describe '#land_at' do
    it { is_expected.to respond_to(:land_at).with(1).argument }

    context 'when the plane is not in flight' do
      it 'raises an exception' do
        expect do
          docked_plane.land_at airport
        end.to raise_exception("Plane is not in flight!")
      end
    end

    context 'when the plane is in flight' do
      it 'lands at an airport and confirms' do
        expect(airport).to receive(:inbound) { in_flight_plane }
        expect(in_flight_plane).to receive(:new_location) { airport }
        expect(in_flight_plane.land_at airport).to be_truthy
      end

      it 'raises exception and does not land if destination weather is stormy' do
        allow(airport).to receive(:stormy?) { true }
        expect do
          in_flight_plane.land_at airport
        end.to raise_exception("Unable to land plane in stormy weather")
        expect(in_flight_plane.in_flight?).to be_truthy
      end
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(0).arguments }

    context 'when the plane is in flight' do

      it 'raises an exception' do
        expect do
          in_flight_plane.take_off
        end.to raise_exception("Plane is in flight!")
      end
    end

    context 'when the plane is stationed at an airport' do
      it 'takes off from the airport and confirms' do
        expect(airport).to receive(:outbound) { docked_plane }
        expect(docked_plane).to receive(:new_location) { nil }
        expect(docked_plane.take_off).to be_truthy
      end

      it 'raises an exception if weather is stormy' do
        allow(airport).to receive(:stormy?) { true }
        expect do
          docked_plane.take_off
        end.to raise_exception("Unable to take off in stormy weather")
      end

      it 'sets plane state to in_flight' do
        expect(airport).to receive(:outbound) { docked_plane }
        docked_plane.take_off
        expect(docked_plane.in_flight?).to be_truthy
      end
    end
  end

  describe '#location' do
    context 'when plane is stationed at an airport' do
      it 'returns the airport code' do
        allow(airport).to receive(:to_s) { "LAX" }
        expect(docked_plane.location).to eq "LAX"
      end
    end

    context 'when a plane is in flight' do
      it "returns \'In flight\'" do
        expect(in_flight_plane.location).to eq "In flight"
      end
    end
  end

  describe '#in_flight?' do
    it { is_expected.to respond_to(:in_flight?) }

    context 'when the plane is stationed at an airport' do
      it 'returns false' do
        # Plane is not in flight by default because it is associated with
        # an airport at initialization
        expect(docked_plane.in_flight?).to be_falsy
      end
    end

    context 'when the plane has taken off' do
      it 'returns true' do
        allow(airport).to receive(:stormy?) { false }
        allow(airport).to receive(:outbound) { docked_plane }
        docked_plane.take_off
        expect(docked_plane.in_flight?).to be_truthy
      end
    end
  end
end
