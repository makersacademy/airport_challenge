require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { double(:airport) }

  context 'when weather is not stormy' do
    before { allow(airport).to receive(:stormy?).and_return false }
    before { allow(airport).to receive(:land) }
    before { allow(airport).to receive(:take_off) }

    describe '#landed_status' do
      it 'set to false upon initialization' do
        expect(plane.landed_status).to eq false
      end

      it 'set to true when plane lands' do
        plane.landed
        expect(plane.landed_status).to eq true
      end

      it 'set to false when plane departs' do
        plane.departed
        expect(plane.landed_status).to eq false
      end
    end

    describe '#landed' do
      it 'returns true when plane lands in airport' do
        airport.land(plane)
        expect(plane.landed).to eq true
      end
    end

    describe '#departed' do
      it 'returns false when plane takes off from airport' do
        airport.take_off(plane)
        expect(plane.departed).to eq false
      end
    end
  end
end
