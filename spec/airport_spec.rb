require "./lib/airport"
require "./lib/weather"

describe Airport do
  it "allows a plane to land at airport" do
    expect(subject).to respond_to(:land).with(1).arguments
  end

  it "allows a plane to takeoff, and confirms it is no longer in the airport" do
    airport = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    airport.land(plane1)
    airport.land(plane2)
    airport.takeoff(plane2)
    expect(airport.planes_hub.count).to eq 1
  end

  it "return an error if airport is full" do
    airport = Airport.new
    50.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error "this airport is full"
  end
  it "has a default airport capacity that can be overridden" do
    airport = Airport.new
    expect(airport.capacity).to eq 50
  end
end
