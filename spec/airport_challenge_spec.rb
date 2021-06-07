require 'airport_challenge'
require 'plane'

describe Airport do
  let(:airport) { Airport.new(20) }
  let(:plane) { Plane.new }

  describe '#land' do
    it 'allows a plane to land' do
      expect(airport).to respond_to :land
    end

    it 'puts plane in airport' do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport.land(plane)).to include plane
    end

    context 'when at capacity' do
      it 'prevents landing' do
        allow(airport).to receive(:stormy?).and_return false
        20.times { airport.land(plane) }
        expect(airport.land(plane)).to eq "Sorry, airport's full!"
      end
    end

    context 'when stormy' do
      it 'prevents landing' do
        allow(airport).to receive(:stormy?).and_return true
        expect(airport.land(plane)).to eq "No landings while weather is stormy"
      end
    end
  end

  describe '#takeoff' do
    it 'instructs plane to takeoff' do
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq "#{plane} has left the airport"
    end

    context 'when stormy' do
      it 'prevents takeoff' do
        allow(airport).to receive(:stormy?).and_return true
        expect(airport.takeoff(plane)).to eq "No takeoffs while weather is stormy"
      end
    end
  end
end
