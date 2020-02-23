require "airport"

describe Airport do
  it { is_expected.to respond_to :land_plane }

  it { is_expected.to respond_to :takeoff_plane }

  it "takes off plane and confirms its absense" do
    plane = Plane.new
    subject.takeoff_plane(plane)
    expect(plane).to_not be_landed
  end
end