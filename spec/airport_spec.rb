require 'airport'
require 'weather'

describe Airport do
  let(:plane) { double :plane }
  subject(:airport) { described_class.new }
  before(:each) { allow(airport.weather).to receive(:is_stormy) { false } }
  #let(:weather_double) { double :weather }

  context '#stormy?' do
    before(:each) { allow(airport.weather).to receive(:is_stormy) { true } }

    it 'can check if weather is stormy' do
      expect(airport).to be_stormy
    end

    it 'should not allow planes to land when stormy' do
      expect { airport.land_plane(plane) }.to raise_error(FlightLandingError, "No landing when stormy")
    end

    it 'should not allow planes to takeoff when stormy' do
      airport.hangar << plane
      expect { airport.takeoff_plane(plane) }.to raise_error(FlightTakeoffError, "No takeoff when stormy")
    end

  end

  describe 'landing plane' do
    before(:each) { allow(plane).to receive(:airborne?) { true } }

    it 'should allow plane to land in airport' do
      allow(plane).to receive(:landed) { 'landed' }
      allow(plane).to receive(:flight_number) { 1 }
      expect(airport.land_plane(plane)).to eq "Landed: Makers #1"
    end

    it 'should only allow airborne planes to land' do
      allow(plane).to receive(:airborne?) { false }
      expect { airport.land_plane(plane) }.to raise_error(FlightLandingError, "Plane has already been landed")
    end

    it 'should not allow landing when airport is full' do
      allow(plane).to receive(:landed) { 'landed' }
      allow(plane).to receive(:flight_number)
      airport.capacity.times { subject.land_plane plane }
      expect { airport.land_plane(plane) }.to raise_error(FlightLandingError, "Airport is full")
    end

  end

  describe 'taking off plane' do
    before(:each) { allow(plane).to receive(:airborne?) { false } }

    it 'should allow plane to take off' do
      airport.hangar << plane
      allow(plane).to receive(:takeoff) { 'airborne' }
      allow(plane).to receive(:flight_number) { 1 }
      expect(airport.takeoff_plane(plane)).to eq "Taken off: Makers #1"
    end

    it 'should only allow landed planes to takeoff' do
      allow(plane).to receive(:airborne?) { true }
      expect { airport.takeoff_plane(plane) }.to raise_error(FlightTakeoffError, "Plane is already airborne")
    end

    it 'allows planes to takeoff from only airports they are landed in' do
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.hangar << plane
      expect { airport2.takeoff_plane(plane) }.to raise_error(FlightTakeoffError, "Plane is not in hangar")
    end

  end

  describe 'capacity of airport' do
    it 'allows a new airport to be created with a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows default capacity to be overriden' do
      airport.capacity = 40
      expect(airport.capacity).to eq 40
    end
  end

  describe 'checking hangar' do
    it 'allows for airplanes in hangar to be returned' do
      airport.hangar << plane
      allow(plane).to receive(:flight_number) { 1 }
      expect(airport.check_hangar).to eq "Makers #1"
    end

    it 'returns empty notification if hangar is empty' do
      expect(airport.check_hangar).to eq "Hangar is empty"
    end
  end

end
