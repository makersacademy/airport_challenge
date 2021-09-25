require "./lib/airport"
describe Airport do
  it "allows a plane to land at airport" do
    expect(subject).to respond_to(:land).with(1).arguments
  end
  it "allows a plane to takeoff from the airport" do
    expect(subject).to respond_to(:takeoff).with(1).arguments
    expect(Plane.new.departed).to eq true
  end
  it "return an error if airport is full" do
    airport = Airport.new
    plane1 = Plane.new
    airport.land(plane1)
    expect { airport.land(Plane.new) }.to raise_error
    "this airport is full"
  end
  it "has a default airport capacity that can be overridden" do
    airport = Airport.new
    expect(airport.capacity).to eq 50
  end
end
