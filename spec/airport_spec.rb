require 'airport'

describe Airport do
  
  it "Checks if the plane or planes land at the airport when instructed" do
    plane = Plane.new
    expect(subject.instructions("land",plane)).to eq [plane]
  end

  it "Checks if more than one plane can land on an airport when instrcuted to land" do
    plane1 = Plane.new
    subject.instructions("land", plane1)
    plane2 = Plane.new
    expect(subject.instructions("land",plane2)).to eq [plane1, plane2]
  end
end
