require 'airport'

describe Airport do
  it { is_expected.to respond_to(:landing_plane).with(1).argument }

  plane = Plane.new
  it "Allows a plane to land" do
    expect(subject.landing_plane(plane)).to eq true
  end

  it "doesn't allow planes to land or takeoff in bad weather" do
    expect(subject.weather).to eq "Apologies due to bad weather you'll not be able to land!"
  end

end
