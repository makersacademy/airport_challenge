require 'airport'

describe Airport do
  it "can land " do
    expect(subject).to respond_to :land
  end

  it "make a plane land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "has the ability to store a plane" do
    expect([]).to be_empty
  end

  it "can store a landing plane" do
    plane=Plane.new
    airport=Airport.new
    airport.land(plane)
    expect(:landed_planes).not_to be_empty
  end

  it "can store planes" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.landed_planes).to include plane
  end

  it "responds to #takeoff method" do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end

  it "no longer contains that plane in @landed_planes after takeoff" do
    plane = Plane.new
    subject.takeoff(plane)
    expect(subject.landed_planes).not_to include plane
  end

end
