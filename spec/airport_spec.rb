require_relative "../lib/airport"
require_relative "../lib/plane"

describe Airport do
  it "lands at an airport" do
    plane = Plane.new
    subject.land_a_plane(plane)
    expect(subject.planes).to include(plane)
  end
end
