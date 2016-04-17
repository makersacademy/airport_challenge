require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  #let(:airport) { double(:airport) }

  context 'when weather is not stormy' do
    describe '#landed_status' do
      # before { allow(airport).to receive(:stormy?).and_return false }
      # before { allow(airport).to receive(:land) }

      it 'set to false upon initialization' do
        expect(plane.landed_status).to eq false
      end

      it 'set to true upon landing' do
        airport = Airport.new
        allow(airport).to receive(:stormy?).and_return false
        airport.land(plane)
        expect(plane.landed_status).to eq true
      end

      it 'set to false upon take off' do
      #allow(airport).to receive(:take_off)
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      airport.take_off(plane)
      expect(plane.landed_status).to eq false
      end
    end
  end

end
