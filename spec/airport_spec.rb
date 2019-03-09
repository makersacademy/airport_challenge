require 'airport'

describe Airport do
  it "Checks if a plane lands on an airport" do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it "Checks if more than one plane can land on an airport" do
    plane1 = Plane.new
    subject.land(plane1)
    plane2 = Plane.new
    expect(subject.land(plane2)).to eq [plane1, plane2]
  end
  
end
