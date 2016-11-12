require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  context "landing a plane"

  it "should have a land_plane method" do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it "should check arg given is a plane object" do
    plane = Plane.new
    allow(subject).to receive(:land_plane) {plane}
    expect(subject.land_plane(plane)).to be_a Plane
  end

  it "should raise error if arg is not a plane" do
    plane = "I'm not a plane"
    expect{ subject.land_plane(plane) }.to raise_error("Only planes can be landed")
  end

  it "should raise error if plane has already been landed" do
    plane = Plane.new
    expect{ subject.land_plane(plane) }.to raise_error("Plane has already landed")
  end

  it "should change landed status to true if it was false" do
    plane = Plane.new
    plane.landed_status = false
    expect(subject.land_plane(plane)).to eq true
  end

  it "should have a check status method" do
    expect(subject).to respond_to(:has_plane_landed?).with(1).argument
  end

  it "should let user know if a plane has landed" do
    plane = Plane.new
    expect(subject.has_plane_landed?(plane)).to eq "yes"
  end
end
