require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  describe '#land' do
    it 'should respond to the land method' do
      expect(airport).to respond_to(:land).with(1).arguments
    end
    it 'should land a plane' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.hangar.last).to eq plane
    end
    it 'should not allow a plane to land if the hangar is full' do
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error("Hangar is full!")
    end

  end
  describe '#takeoff' do
    plane = Plane.new
    it 'should show the plane leaving the hangar' do
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq(plane)
    end
    it 'should remove the plane from the hangar' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.hangar).to eq []
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
