require 'airport'
require 'plane'

describe 'The Airport Challenge' do
  let(:good_weather) { double("weather_service", alert?: false)}
  let(:bad_weather) { double("weather_service", alert?: true)}

  describe 'Controller can instruct a plane to land at an airport' do
    describe 'plane' do
      it 'can be instructed to land at an airport' do
        plane = Plane.new
        airport = Airport.new(Airport::DEFAULT_CAPACITY, good_weather)
        plane.land(airport)
        expect(plane).not_to be_in_flight
      end
    end
  end

  describe 'Controller can instruct plane to take off' do
    describe 'plane' do
      it 'can be confirmed as in flight' do
        plane = Plane.new
        airport = Airport.new(Airport::DEFAULT_CAPACITY, good_weather)
        plane.land(airport)
        plane.takeoff
        expect(plane).to be_in_flight
      end
    end
  end

  describe 'Controller can prevent landing when airport full' do
    describe 'airport' do
      it 'raises an error if a plane tries to land when full' do
        plane1 = Plane.new
        plane2 = Plane.new
        airport = Airport.new(Airport::DEFAULT_CAPACITY, good_weather)
        plane1.land(airport)
        expect { plane2.land(airport) }.to raise_error("Sorry, Hangar Full")
      end
    end
  end

  describe 'Designer can override a default capacity' do
    describe 'airport' do
      it 'planes can reach specified capacity limit before a warning' do
        airport = Airport.new(13, good_weather)
        13.times { Plane.new.land(airport) }
        expect { Plane.new.land(airport) }.to raise_error("Sorry, Hangar Full")
      end
    end
  end

  describe 'Controller can prevent takeoff if stormy' do
    describe 'airport' do
      it 'will not allow takeoff if stormy' do
        plane = Plane.new
        airport = Airport.new(Airport::DEFAULT_CAPACITY, bad_weather)
        expect { airport.release(plane) }.to raise_error "Sorry, Runways Closed, Storms Approaching"
      end
    end
  end

  describe 'Controller can prevent landing if stormy' do
    describe 'airport' do
      it 'will not allow landing if stormy' do
        plane = Plane.new
        airport = Airport.new(Airport::DEFAULT_CAPACITY, bad_weather)
        expect { airport.receive(plane) }.to raise_error "Sorry, Runways Closed, Storms Approaching"
      end
    end
  end
end
