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
    it "Check if plane will take off in a stormy weather" do
      airport.stormy = true
      expect { airport.take_off(plane0.plane_sign) }.to raise_error("Stormy weather, can't take off now!")
    end
    it "Check if plane will land in a stormy weather" do
      plane1 = Planes.new("plane1")
      airport.stormy = true

      expect { airport.land(plane1.plane_sign) }.to raise_error("Stormy weather, can't land now!")
    end
    it "Check if plane will land in a full airport after setting capacity to 10 planes only" do
      airport.stormy = false
      airport.capacity.times{
        plane2 = Planes.new("plane2")
        airport.land(plane2.plane_sign)
      }
      plane2 = Planes.new("plane2")
      expect { airport.land(plane2.plane_sign) }.to raise_error("Airport full, can't land now!")
    end
  end
end
