require 'airport'

describe Airport do

  let (:full_hanger) { DEFAULT_CAPACITY.times { subject.hanger << Plane.new } }
  
  it { is_expected.to respond_to(:land_plane) }
  it { is_expected.to respond_to(:plane_take_off) }

  it "is expected to put plane into the @hanger when it lands" do
    expect { subject.land_plane }.to change { subject.hanger.count }.by(1)
  end

  it "is expected to remove plane from the @hanger" do
    subject.land_plane
    expect { subject.plane_take_off }.to change { subject.hanger.count }.by(-1)
  end

  it "is expected to prevent landing and raise error if @hanger is full" do
    full_hanger
    expect { subject.land_plane }.to raise_error("Airport hanger is full")
  end
end
