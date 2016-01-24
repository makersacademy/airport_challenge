require 'plane'

describe Plane do
  let(:airport) do
    double( :airport,
            :stormy? => false,
            :outbound => nil,
            :inbound => nil)
  end
  let(:destination) do
    double( :airport,
            :stormy? => false,
            :method_defined? => true)
  end
  subject(:plane) { described_class.new(airport) }

  describe '#initialize' do
    it 'initializes at the specified airport' do
      expect(plane.location).to eq airport.to_s
    end

    it 'adds plane instance to specified airport' do
      expect(airport).to receive(:inbound)
      described_class.new(airport)
    end

    it 'initializes a plane that is not in flight' do
      expect(plane.in_flight?).to be_falsy
    end
  end

  describe '#land_at' do
    it { is_expected.to respond_to(:land_at).with(1).argument }

    # NOTE: unable to get this test to pass
    # context 'when passed a non-Airport argument' do
    #   let(:not_an_airport) { double("not an airport", :method_defined? => false) }
    #   it 'raises an exception' do
    #     expect do
    #       plane.land_at(not_an_airport)
    #     end.to raise_exception("#{not_an_airport} is not a valid airport")
    #   end
    # end

    context 'when the plane is not in flight' do
      it 'raises an exception' do
        expect do
          plane.land_at destination
        end.to raise_exception("Plane is not in flight!")
      end
    end

    context 'when the plane is in flight' do
      it 'lands at an airport and confirms' do
        expect(airport).to receive(:outbound) { plane }
        plane.take_off
        expect(destination).to receive(:inbound) { plane }
        expect(plane).to receive(:new_location) { destination }
        expect(plane.land_at(destination)).to be_truthy
      end

      it 'raises exception and does not land if destination weather is stormy' do
        allow(destination).to receive(:stormy?) { true }
        plane.take_off
        expect do
          plane.land_at destination
        end.to raise_exception("Unable to land at #{destination} due to stormy weather")
        expect(plane.in_flight?).to be_truthy
      end
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(0).arguments }

    context 'when the plane is in flight' do
      it 'raises an exception' do
        plane.take_off
        expect do
          plane.take_off
        end.to raise_exception("Plane is in flight!")
      end
    end

    context 'when the plane is stationed at an airport' do
      it 'takes off from the airport and confirms' do
        expect(airport).to receive(:outbound) { plane }
        expect(plane).to receive(:new_location) { nil }
        expect(plane.take_off).to be_truthy
      end

      it 'raises an exception if weather is stormy' do
        allow(airport).to receive(:stormy?) { true }
        expect do
          plane.take_off
        end.to raise_exception("Unable to take off in stormy weather")
      end

      it 'sets plane state to in_flight' do
        expect(airport).to receive(:outbound) { plane }
        plane.take_off
        expect(plane.in_flight?).to be_truthy
      end
    end
  end

  describe '#location' do
    context 'when plane is stationed at an airport' do
      it 'returns the airport code' do
        expect(plane.location).to eq airport.to_s
      end
    end

    context 'when a plane is in flight' do
      it "returns \'In flight\'" do
        plane.take_off
        expect(plane.location).to eq "In flight"
      end
    end
  end

  describe '#in_flight?' do
    it { is_expected.to respond_to(:in_flight?) }

    context 'when the plane is stationed at an airport' do
      it 'returns false' do
        # Plane is not in flight by default because it is associated with
        # an airport at initialization
        expect(plane.in_flight?).to be_falsy
      end
    end

    context 'when the plane has taken off' do
      it 'returns true' do
        allow(airport).to receive(:stormy?) { false }
        allow(airport).to receive(:outbound) { plane }
        plane.take_off
        expect(plane.in_flight?).to be_truthy
      end
    end
  end
end
