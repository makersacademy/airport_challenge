require 'airport'

describe Airport do

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
