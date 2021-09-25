require "./lib/airport"
describe Airport do
  it "allows a plane to land at airport" do
    expect(subject).to respond_to(:land).with(1).arguments
  end
  it "allows a plane to takeoff from the airport" do
    expect(subject).to respond_to(:takeoff).with(1).arguments
    expect(Plane.new.departed).to eq true
  end
end
