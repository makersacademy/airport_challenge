require 'plane'

describe Plane do
  let(:airport) { double :airport }
  subject { described_class.new(airport) }

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

  describe '#land' do
    context 'when the plane is in flight' do
      let(:destination) { double :airport }

      it { is_expected.to respond_to(:land).with(1).argument }

      it 'lands at an airport and confirms' do
        allow(destination).to receive(:stormy?) { false }
        expect(subject.land(destination)).to be_truthy
      end

      it 'raises exception and does not land if destination weather is stormy' do
        allow(destination).to receive(:stormy?) { true }
        expect{ subject.land(destination) }.to raise_exception("Unable to land plane in stormy weather")
        # TODO: expect subject location to remain airport
      end

      # TODO: test that landing sets location
    end
  end

  describe '#take_off' do
    context 'when the plane is stationed at an airport' do
      it { is_expected.to respond_to(:take_off).with(0).arguments }

      it 'takes off from the airport and confirms' do
        allow(airport).to receive(:stormy?) { false }

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
        subject.take_off
        expect(subject.in_flight?).to be_truthy
      end
    end
  end
end
