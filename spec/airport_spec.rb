require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  describe '#land' do
    it 'should respond to the land method' do
      expect(airport).to respond_to(:land).with(1).arguments
    end
    it 'should land a plane' do
      plane = Plane.new(false)
      allow(Weather).to receive(:stormy?) { false }
      airport.land(plane)
      expect(airport.hangar.last).to eq plane
    end
    it 'should not allow a plane to land if the hangar is full' do
      allow(Weather).to receive(:stormy?) { false }
      airport.capacity.times { airport.land(Plane.new(false)) }
      expect { airport.land(Plane.new(false)) }.to raise_error("Hangar is full!")
    end
    it 'should not allow a plane to land if the weather is stormy' do
      allow(Weather).to receive(:stormy?) { true }
      expect { airport.land(Plane.new(false)) }.to raise_error("Can't land, weather is stormy!")
    end

    it 'should not allow a plane to land if it is already in an airport' do
      plane = Plane.new
      allow(Weather).to receive(:stormy?) { false }
      expect { airport.land(plane) }.to raise_error("This plane is already in a hangar!")
    end
  end
  describe '#takeoff' do
    plane = Plane.new(false)
    it 'should show the plane leaving the hangar' do
      allow(Weather).to receive(:stormy?) { false }
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq(plane)
    end
    it 'should remove the plane from the hangar' do
      allow(Weather).to receive(:stormy?) { false }
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.hangar).to eq []
    end
    it 'should not allow a plane to leave if the weather is stormy' do
      airport.hangar << plane
      allow(Weather).to receive(:stormy?) { true }
      expect { airport.takeoff(plane) }.to raise_error("Can't take off, weather is stormy!")
    end

    it 'should not allow a plane to leave if the plane is not in a hangar' do
      airport.hangar << plane
      allow(Weather).to receive(:stormy?) { false }
      expect { airport.takeoff(plane) }.to raise_error("Can't take off, plane not in hangar!")
    end
    context 'The airport capacity' do
      it 'should have a default hangar capacity of 20' do
        expect(Airport::DEFAULT_CAPACITY).to eq 20
      end

      it 'should take the argument provided and make it the default capacity' do
        test_port = Airport.new(15)
        expect(test_port.capacity).to eq(15)
      end
    end
  end
end
