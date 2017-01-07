require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land_plane).with(1).argument }

  #it { is_expected.to respond_to(:landing_bay) }
=begin
  it "should land a plane" do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane
  end
=end
  it "should change the status before permitting plane to land" do
    plane = Plane.new
    landed_plane = subject.land_plane(plane)
    expect(subject.land_plane(plane)).to eq "Landed"
  end
=begin
  it "should land a plane in the landing bay" do
    plane = Plane.new
    landed_plane = subject.land_plane(plane)
    expect
  end
=end
end
