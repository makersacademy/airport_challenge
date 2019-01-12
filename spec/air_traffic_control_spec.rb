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
    it "Check if plane in airport or not" do
      plane0 = Plane.new("plane0")
      airport = AirTrafficControl.new
      airport.land(plane0.plane_sign)
      airport.take_off(plane0.plane_sign)
      expect(airport.planes.include?(plane0.plane_sign)).to eq false
    end
  end
end
