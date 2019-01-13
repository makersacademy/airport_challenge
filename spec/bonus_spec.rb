require 'air_traffic_control'

describe AirTrafficControl do
  context "1- Creating a test to land and take off several planes, and reporting the current action and list of planes in the airport after each action" do
    test_airport = AirTrafficControl.new
    test_airport.capacity = 15
    landing_index = 1
    take_off_index = 1

    # Land 5 new planes (5)
    5.times{
      callsign = "plane" + landing_index.to_s
      test_airport.land(callsign)
      landing_index += 1
    }

    # Takeoff 3 planes (2)
    3.times{
      callsign = "plane" + take_off_index.to_s
      test_airport.take_off(callsign)
      take_off_index += 1
    }

    # Land 8 new planes (10)
    8.times{
      callsign = "plane" + landing_index.to_s
      test_airport.land(callsign)
      landing_index += 1
    }

    # Takeoff 7 planes (3)
    7.times{
      callsign = "plane" + take_off_index.to_s
      test_airport.take_off(callsign)
      take_off_index += 1
    }

    # Land 2 new planes (5)
    2.times{
      callsign = "plane" + landing_index.to_s
      test_airport.land(callsign)
      landing_index += 1
    }

    # Takeoff 5 planes (0)
    5.times{
      callsign = "plane" + take_off_index.to_s
      test_airport.take_off(callsign)
      take_off_index += 1
    }

    it "Checking total number of planes in airport, should be 0" do
      expect(test_airport.planes_list.count).to eq (0)
    end
  end
end
