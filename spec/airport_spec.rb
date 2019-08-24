require "airport.rb"

describe Airport do
  it "Test allow airplane to land at airport" do
    plane1 = Plane.new
    expect(subject.land_plane(plane1)).to eq (plane1)
  end
  it "Test allows a plane to take off and confirm its not in the airport" do
    plane1 = Plane.new
    expect(subject.takeoff_plane(plane1)).to eq (true)
  end
  it "Test arrived plane is at the airport" do
    plane1 = Plane.new
    expect(subject.plane_in_airport?(plane1)).to eq(true)
  end
end
