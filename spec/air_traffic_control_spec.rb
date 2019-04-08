require 'air_traffic_control'

describe AirTrafficControl do
  context "Initial context" do
    it "check responce of land method in ATC class" do
      is_expected.to respond_to(:land)
    end
    it "check responce of take_off method in ATC class" do
      is_expected.to respond_to(:take_off)
    end
  end

  context "Checking if land/take_off adds/removes a plane from airport" do
    plane0 = Planes.new("plane0")
    airport = AirTrafficControl.new
    airport.land(plane0.plane_sign)
    it "Check if plane in airport or not" do
      airport.take_off(plane0.plane_sign)
      expect(airport.planes_list.include?(plane0.plane_sign)).to eq false
    end
  end

  context "Cecking if land/take_off works in stormy weather" do
    plane0 = Planes.new("plane0")
    airport = AirTrafficControl.new
    airport.land(plane0.plane_sign)
    it "Check if plane will take off in a stormy weather" do
      airport.stormy = true
      expect { airport.take_off(plane0.plane_sign) }.to raise_error("Stormy weather, can't take off now!")
    end

    it "Check if plane will land in a stormy weather" do
      plane1 = Planes.new("plane1")
      airport.stormy = true

      expect { airport.land(plane1.plane_sign) }.to raise_error("Stormy weather, can't land now!")
    end
  end

  context "Checking if land/take_off works in full/empty airports" do
    additional_plane = Planes.new("additional_plane1")
    airport = AirTrafficControl.new
    it "Check if plane will land in a full airport" do
      airport.stormy = false
      i = 1
      airport.capacity.times{
        callsign = "plane" + i.to_s
        airport.planes_list << callsign
        i += 1
      }
      expect { airport.land(additional_plane.plane_sign) }.to raise_error("Airport full, can't land now!")
    end

    it "Check if plane will takeoff from an empty airport" do
      empty_airport = AirTrafficControl.new
      empty_airport.stormy = false
      expect { empty_airport.take_off(additional_plane.plane_sign) }.to raise_error("Airport empty, no planes to takeoff!")
    end
  end

  context "Checking landing and taking off twice" do
    airport = AirTrafficControl.new
    plane3 = Planes.new("plane3")
    airport.land(plane3.plane_sign)
    plane4 = Planes.new("plane4")
    airport.land(plane4.plane_sign)
    airport.take_off("plane4")
    it "After plane4 took off, request take off again, should raise an error!" do
      expect { airport.take_off("plane4") }.to raise_error("This plane left the airport already!")
    end

    it "After plane3 landed, request landing again, should raise an error!" do
      expect { airport.land("plane3") }.to raise_error("This plane landed in the airport already!")
    end
  end
end
