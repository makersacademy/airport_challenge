require 'traffic_controller'
require 'plane'
require 'airport'

describe TrafficController do
  it "land plane to an airport" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    airport = Airport.new

    expect(traffic_controller.land_to(plane, airport)).to eq(true)
  end

  it "take off plane from an airport and confirm plane left airport" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    airport = Airport.new

    expect(traffic_controller.takeoff_from(plane, airport)).to eq(true)
    expect(plane.left_airport?).to eq(true)
  end
end
