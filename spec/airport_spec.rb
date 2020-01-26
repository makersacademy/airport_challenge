require 'airport'

describe Airport do
# this is for the landing_plane method in airport.rb

  it { is_expected.to respond_to :land_plane }
  it { is_expected.to respond_to :take_off_plane }

  # it {is_expected.to respond_to(:land).with(1).argument }

  it "land a plane" do
    plane = subject.land_plane
    expect(plane).to be_landed
  end
  it "take off a Plane" do
    plane = subject.take_off_plane
    expect(plane).to be_take_off
  end
  it "plane took off confirmed" do
    plane = Plane.new
    subject.take_off_plane(plane)
    expect(subject.plane).to eq plane
  end
end
