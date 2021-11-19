require "airport"

describe Airport do
  it "planes should be able to land at the airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "we should be able to see that the plane has landed in the airport" do
    expect(subject.land(plane = Plane.new)).to eq(plane)
  end

  it "planes should be able to take off from the airport" do
    expect(subject).to respond_to(:takeoff)
  end

  it "we should be able to see that the plane has taken off from the airport" do
    subject.land(plane = Plane.new)
    subject.takeoff
    expect(subject.plane).to eq(nil)
  end
end
