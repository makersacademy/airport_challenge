require "airport"

describe "Airport" do

  it "receives a plane" do
    subject = Airport.new
    plane = Plane.new
    expect(subject.receive_plane(plane)).to eq plane
  end

  it "confirms that a plane landed" do
    plane = Plane.new
    expect(plane).to be_landed
  end

  it "allows plane to take-off" do
    subject = Airport.new
    plane = Plane.new
    expect(subject.dispatch_plane(plane)).to eq plane
  end

  it "confirms that a plane has taken-off" do
    plane = Plane.new
    expect(plane).to be_take_off
  end

end
