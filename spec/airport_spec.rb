require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  context 'landing a plane' do

    it 'expects plane to be in airport' do
      allow(airport).to receive(:weather) { "sunny" }
      airport.land(plane)
      expect(airport.landed_planes).to include(plane)
    end

    it 'checked that if plane already landed get error' do
      allow(airport).to receive(:weather) { "sunny" }
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error("Plane already landed.")
    end

  end

  context 'take off' do

    it 'expects plane to not be in airport' do
      allow(airport).to receive(:weather) { "sunny" }
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.landed_planes).not_to include(plane)
    end

    it 'plane takes off' do
      allow(airport).to receive(:weather) { "sunny" }
      expect(airport.takeoff(plane)).to eq("Plane safely taken off.")
    end
    
  end

  context 'stormy weather' do

    describe 'take off' do
      it 'prevents take off' do
        plane = Plane.new
        allow(airport).to receive(:weather) { "stormy" }
        expect { airport.takeoff(plane) }.to raise_error("To stormy to take off.")
      end
    end

    describe 'landing' do
      it 'prevents landing' do
        allow(airport).to receive(:weather) { "stormy" }
        expect { airport.land(plane) }.to raise_error("To stormy to land.")
      end
    end

  end

end
