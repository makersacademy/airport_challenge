require "airport.rb"

describe Airport do
  it "Test allow airplane to land at airport" do
    plane1 = Plane.new
    expect(subject.land_plane(plane1)).to eq (plane1)
  end
end
