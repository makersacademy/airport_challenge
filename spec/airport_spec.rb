require "airport"

describe TrafficControl do
  it "allows planes to land at an airport" do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end
    
  it "allows planes to take off from the airport" do
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.runway).to eq []
  end
  
  it "does not allow planes to land in stormy weather" do
    plane = Plane.new
    expect{ subject.land plane }.to raise_error "Stormy weather"
  end
    
  it "does not allow planes to take off in stormy weather" do
    plane = Plane.new
    expect{ subject.takeoff plane }.to raise_error "Stormy weather"
  end
end

describe initialize do
  it "does not allow planes to land when airport is full" do
    atc = TrafficControl.new(50)
    50.times { atc.land(Plane.new) }
    expect{ atc.land Plane.new }.to raise_error "Runway full"
  end
  
  it "has a default capacity" do
    atc = TrafficControl.new(5)
    expect(atc.capacity).to eq 5
  end
end
