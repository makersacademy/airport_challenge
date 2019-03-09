require 'airport'

describe Airport do
  
  it "Checks if the plane lands at the airport when instructed" do
    plane = Plane.new
    expect(subject.instructions("land",plane)).to eq [plane]
  end

  it "Checks if more than one plane can land on an airport when instrcuted to land" do
    plane1 = Plane.new
    subject.instructions("land", plane1)
    plane2 = Plane.new
    expect(subject.instructions("land",plane2)).to eq [plane1, plane2]
  end
  
  it "Checks if plane takes off from the airport when instructed to takeoff and shows an empty runway" do
    plane = Plane.new
    expect(subject.instructions("takeoff",plane)).to eq []
  end

end
