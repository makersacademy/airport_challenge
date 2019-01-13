require 'air_traffic_control'

describe AirTrafficControl do
  context "1- Creating a test to land and take off several planes, and reporting the current action and list of planes in the airport after each action" do
    test_airport = AirTrafficControl.new
    test_airport.capacity = 15
    landing_index = 1
    take_off_index = 1
    #puts
    #puts "test_airport created with 15 free slots for new planes."

    # Land 5 new planes (5)
    5.times{
      callsign = "plane" + landing_index.to_s
      test_airport.land(callsign)
      landing_index += 1
      #puts callsign + " landed, now the list of planes in the airport is:"
      #print test_airport.planes_list
      #puts
    }

    # Takeoff 3 planes (2)
    3.times{
      callsign = "plane" + take_off_index.to_s
      test_airport.take_off(callsign)
      take_off_index += 1
      #puts callsign + " took off, now the list of planes in the airport is:"
      #print test_airport.planes_list
      #puts
    }

    # Land 8 new planes (10)
    8.times{
      callsign = "plane" + landing_index.to_s
      test_airport.land(callsign)
      landing_index += 1
      #puts callsign + " landed, now the list of planes in the airport is:"
      #print test_airport.planes_list
      #puts
    }

    # Takeoff 7 planes (3)
    7.times{
      callsign = "plane" + take_off_index.to_s
      test_airport.take_off(callsign)
      take_off_index += 1
      #puts callsign + " took off, now the list of planes in the airport is:"
      #print test_airport.planes_list
      #puts
    }

    # Land 2 new planes (5)
    2.times{
      callsign = "plane" + landing_index.to_s
      test_airport.land(callsign)
      landing_index += 1
      #puts callsign + " landed, now the list of planes in the airport is:"
      #print test_airport.planes_list
      #puts
    }

    # Takeoff 5 planes (0)
    5.times{
      callsign = "plane" + take_off_index.to_s
      test_airport.take_off(callsign)
      take_off_index += 1
      #puts
      #print callsign + " took off, now the number of planes in the airport is: "  + test_airport.planes_list.count.to_s
      #puts
    }

    it "Checking total number of planes in airport, should be 0" do
      expect(test_airport.planes_list.count).to eq (0)
    end
  end
end
