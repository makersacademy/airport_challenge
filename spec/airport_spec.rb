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

=begin
  it "allows plane to take-off" do
    subject = Airport.new
    subject.dispatch_plane
    expect(subject.dispatch_plane)
  end
=end
end
