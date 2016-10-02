require 'plane_file'

describe Plane do

  describe '#proceed_to_land' do
    it {is_expected.to respond_to (:proceed_to_land)}

    it 'allows plane to sucesfully land' do
      test_airport = Airport.new
      test_plane = Plane.new
      test_plane.proceed_to_land(test_airport)
      expect( test_airport.landed?(test_plane) ).to eq true
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

    # it 'for a plane that has taken off from the airport' do
    #   test_plane = Plane.new
    #   test_airport = Airport.new
    #   test_plane.proceed_to_land(test_airport)
    #   test_plane.takeoff_from(test_airport)
    #   expect( test_plane.plane_is_landed ).to eq false
    # end
  end

  describe '#takeoff_from()' do
    it 'instructs a plane to takeoff from wrong airport' do
      # test_plane = Plane.new
      test_airport = Airport.new
      subject.proceed_to_land(test_airport)
      # test_plane.proceed_to_land(test_airport)
      wrong_airport = Airport.new
      expect { subject.takeoff_from(wrong_airport) }.to raise_error 'Plane is not at this airport'
    end

    it 'instructs a plane to takeoff from correct airport' do
      test_plane = Plane.new
      test_airport = Airport.new
      test_plane.proceed_to_land(test_airport)
      test_plane.takeoff_from(test_airport)
      expect( test_plane.plane_is_landed ).to eq false
    end
  end
end
