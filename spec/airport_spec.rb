require_relative '../lib/airport'
require_relative '../lib/plane'

describe Airport do
  subject(:airport) { described_class.new}
  let(:plane) {Plane.new}
  let(:capacity) {Airport::DEFAULT_CAPACITY}

    describe 'Airport characteristics' do
      before { allow(airport).to receive(:stormy?) {false} }
      it 'has a space for the planes to land' do
        expect(subject.arrival(:plane)).to eq([:plane])
      end

      it 'has a default capacity' do
        expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
      end

      it 'the default capacity of the airport can be overriden at will' do
        bigger_airport = Airport.new(20)
        expect(bigger_airport.capacity).to eq(20)
      end

    describe '#full?' do

      before { allow(airport).to receive(:stormy?) {false} }
      it 'can not accept more planes if the airport is full' do
        subject.arrival(:plane)
        expect{Airport::DEFAULT_CAPACITY.times{subject.arrival(:plane)}}.to raise_error("No more planes for today mate")
      end
    describe '#empty' do

      it 'will not allow a plane to leave if there are no planes in the airport' do
        expect{subject.plane_exit(:plane)}.to raise_error("Can't take where there is none")
      end
    end
    end
  end
  describe '#plane_exit' do

    before { allow(airport).to receive(:stormy?) {true} }
    it 'will not allow a plane to take off if the weather is stormy' do
        allow(airport).to receive(:stormy?) {true}
        expect{subject.plane_exit(:plane)}.to raise_error("Can't let the plane out with this weather")
    end
  end
  describe '#arrival' do

    before { allow(airport).to receive(:stormy?) {true} }
    it 'will not allow a plane to land if the weather is stormy' do
      allow(airport).to receive(:stormy?) {true}
      expect{subject.arrival(:plane)}.to raise_error("Can't let you land in this weather")
    end
  end
end
