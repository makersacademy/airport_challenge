require 'airport'

describe Airport do

  let (:full_hanger) { DEFAULT_CAPACITY.times { subject.hanger << Plane.new } }
  let (:half_full_hanger) { 10.times { subject.hanger << Plane.new } }
  let (:plane) { Plane.new(false) }

  it { is_expected.to respond_to(:land_plane) }
  it { is_expected.to respond_to(:plane_take_off) }

  it "is expected to raise error if capacity input value is negative" do
    expect { Airport.new(-1) }.to raise_error("Please input a positive number")
  end

  it "tests to see if default capacity is set" do
    expect(subject.capacity).to eq(DEFAULT_CAPACITY)
  end

  it "initialized with different capacity" do
    expect(Airport.new(3).capacity).to eq(3)
  end

  it "is expected to put plane into the @hanger when it lands" do
    expect { subject.land_plane(plane) }.to change { subject.hanger.count }.by(1)
  end

  it "is expected to remove plane from the @hanger" do
    subject.land_plane(plane)
    expect { subject.plane_take_off(plane) }.to change { subject.hanger.count }.by(-1)
  end

  it "is expected to prevent landing and raise error if @hanger is full" do
    full_hanger
    expect { subject.land_plane(plane) }.to raise_error("Airport hanger is full")
  end

  it "is expected to raise error taking off if plane is not in @hanger" do 
    expect { subject.plane_take_off(plane) }.to raise_error("Plane is not in hanger")
  end

  it "is expected to deny planes to land or take off in stormy weather" do
    half_full_hanger
    allow(subject).to receive(:weather) { 1 }
    expect { subject.land_plane(plane) }.to raise_error("The weather is too stormy to land")
    expect { subject.plane_take_off(plane) }.to raise_error("The weather is too stormy to take off")
  end
  
  it "is expected to remove the correct plane when plane_take_off is called from the @hanger" do
    plane2 = Plane.new(false)
    subject.land_plane(plane)
    subject.land_plane(plane2)
    subject.plane_take_off(plane)
    expect(subject.hanger).to contain_exactly(plane2)
  end

end
