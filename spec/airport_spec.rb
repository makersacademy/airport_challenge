require "airport"

describe "TrafficControl" do
  it "allows planes to land at an airport" do
    plane = Plane.new
    atc = TrafficControl.new
    expect(atc.land(plane)).to eq [plane]
  end
    
  it "allows planes to take off from the airport" do
    plane = Plane.new
    atc = TrafficControl.new
    atc.land(plane)
    atc.takeoff(plane)
    expect(atc.show_runway).to eq []
  end
end
