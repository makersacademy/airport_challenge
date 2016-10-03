require 'plane_file'
require 'weather'
require 'airport'

describe Plane do

  describe '#proceed_to_land()' do
    it {is_expected.to respond_to (:proceed_to_land)}

    it 'allows plane to sucesfully land' do
      test_airport = Airport.new
      test_plane = Plane.new
      test_plane.proceed_to_land(test_airport)
      expect( test_airport.landed?(test_plane) ).to eq true
    end

    it 'except when airport is full' do
      test_airport = Airport.new
      Airport::DEFAULT_CAPACITY.times do
        subject.proceed_to_land(test_airport)
      end
      expect { subject.proceed_to_land(test_airport, false) }.to raise_error 'Landing is not possible. Airport full'
    end
  end

  describe '#plane_is_landed?' do
    it 'for a plane that has landed at the airport' do
      test_plane = Plane.new
      test_airport = Airport.new
      test_plane.proceed_to_land(test_airport)
      expect( test_plane.plane_is_landed ).to eq true
    end

    it 'for a plane that has not yet landed at the airport' do
      test_plane = Plane.new
      expect( test_plane.plane_is_landed ).to eq false
    end

    it 'for a plane that has taken off from the airport' do
      test_plane = Plane.new
      test_airport = Airport.new
      test_plane.proceed_to_land(test_airport)
      test_plane.takeoff_from(test_airport, false)
      expect( test_plane.plane_is_landed ).to eq false
    end
  end

  describe '#takeoff_from()' do
    it 'instructs a plane to takeoff from wrong airport' do
      # test_plane = Plane.new
      test_airport = Airport.new
      subject.proceed_to_land(test_airport)
      wrong_airport = Airport.new
      expect { subject.takeoff_from(wrong_airport, false) }.to raise_error 'Plane is not at this airport'
    end

    it 'instructs a plane to takeoff from correct airport' do
      test_plane = Plane.new
      test_airport = Airport.new
      test_plane.proceed_to_land(test_airport)
      test_plane.takeoff_from(test_airport, false)
      expect( test_plane.plane_is_landed ).to eq false
    end
  end

  describe ' behaviour in stormy weather:' do
    it 'takeoff' do
      weather = double("Weather", :stormy? => true)
      test_plane = Plane.new
      test_airport = Airport.new
      test_plane.proceed_to_land(test_airport, false)
      expect { test_plane.takeoff_from(test_airport, weather.stormy?) }.to raise_error 'Take-off is not possible. All planes have been grounded due to stormy weather'
    end

    it 'takeoff' do
      weather = double("Weather", :stormy? => true)

      test_plane = Plane.new
      test_airport = Airport.new
      expect { test_plane.proceed_to_land(test_airport, weather.stormy?) }.to raise_error 'Landing is not possible. All landing has been suspended due to stormy weather'
    end
  end

end
