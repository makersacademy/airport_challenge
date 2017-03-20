require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:plane_land).with(1).argument }

  it { is_expected.to respond_to(:plane_takeoff) }

  describe 'Landing' do

  it 'plane lands' do
      allow(airport).to receive(:stormy?) { false }
      plane = double(:plane)
      airport.plane_land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'confirms plane has landed' do
      allow(airport).to receive(:stormy?) { false }
      expect(airport.plane_land(double(:plane))).to eq "A plane has landed"
    end
  end

  describe 'Takeoff' do

    it 'plane takes off' do
      allow(airport).to receive(:stormy?) { false }
      airport.plane_land(double(:plane))
      airport.plane_takeoff
      expect(airport.planes).to eq []
    end

    it 'confirms plane has taken off' do
      allow(airport).to receive(:stormy?) { false }
      airport.plane_land(double(:plane))
      expect(airport.plane_takeoff).to eq "Plane has taken off"
    end
  end

  describe 'Stormy' do

    it 'raises an error on takeoff, if weather is stormy' do
      allow(airport).to receive(:stormy?) { false }
      airport.plane_land(double(:plane))
      allow(airport).to receive(:stormy?) { true }
      expect { airport.plane_takeoff }.to raise_error "Weather too stormy to take off"
    end

    it 'raises an error when trying to land, if weather is stormy' do
      allow(airport).to receive(:stormy?) { true }
      expect { airport.plane_land(double(:plane)) }.to raise_error "Weather too stormy to land"
    end
  end

  describe 'Capacity' do

    it 'prevents planes from landing, if airport is full' do
      airport = Airport.new
      100.times do
        allow(airport).to receive(:stormy?) { false }
        airport.plane_land(double(:plane))
      end
      allow(airport).to receive(:stormy?) { false }
      expect { airport.plane_land(double(:plane)) }.to raise_error
    end

    it 'lets user set airport capacity' do
      airport = Airport.new(3)
      3.times do
        allow(airport).to receive(:stormy?) { false }
        airport.plane_land(double(:plane))
      end
      allow(airport).to receive(:stormy?) { false }
      expect { airport.plane_land(double(:plane)) }.to raise_error
    end
  end




end
