require 'airport'

describe Airport do

  let (:full_hanger) { DEFAULT_CAPACITY.times { subject.hanger << Plane.new } }
  let (:half_full_hanger) { 10.times { subject.hanger << Plane.new } }

  

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

  it "tests to see if default capacity is set" do
    expect(Airport.new(3).capacity).to eq(3)
  end

  it "is expected to deny planes to land or take off in stormy weather" do
    half_full_hanger
    allow(subject).to receive(:weather) { 1 }
    expect { subject.land_plane }.to raise_error("The weather is too stormy to land")
    expect { subject.plane_take_off }.to raise_error("The weather is too stormy to take off")
  end

end
