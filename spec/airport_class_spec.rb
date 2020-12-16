require "airport_class.rb"

describe Airport do

  it "has a land_plane method that adds a plane to the hangar" do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.planes).to include plane
  end
end
