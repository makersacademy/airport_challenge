require 'airport'

describe Airport do

  it "has default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "has variable capacity" do
    airport = Airport.new(1000)
    expect(airport.capacity).to eq 1000
  end

  it "should know 1 plane is landed" do
    plane = Plane.new
    plane.land(subject)
    expect(subject.landed_planes).to eq [plane]
  end

  it "should know 2 planes are landed" do
    plane1 = Plane.new
    plane1.land(subject)
    plane2 = Plane.new
    plane2.land(subject)
    expect(subject.landed_planes).to eq [plane1,plane2]
  end

end
