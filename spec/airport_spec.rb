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

describe initialize do
  it "does not allow planes to land when airport is full" do
    atc = TrafficControl.new(50)
    50.times { atc.land(Plane.new) }
    expect { atc.land(Plane.new) }.to raise_error "Runway at maximum capacity"
  end
  
  it "has a default capacity" do
    atc = TrafficControl.new(5)
    expect(atc.capacity).to eq 5
  end
end
