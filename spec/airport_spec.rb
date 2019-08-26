require 'airport'

describe Airport do
  it { is_expected.to respond_to :land_a_plane }

  it { is_expected.to respond_to :take_off_plane }
end

describe "#land_a_plane" do
  it "lands a plane" do
    plane = Plane.new
    expect(Airport.new.land_a_plane(plane)).to eq plane
  end
end
