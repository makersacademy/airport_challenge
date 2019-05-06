require 'airport'

describe Airport do
  plane = Plane.new
  it { is_expected.to respond_to(:land_plane) }
  it { is_expected.to respond_to(:take_off) }

  it "a plane can take off" do
    plane = subject.take_off
  end
end
