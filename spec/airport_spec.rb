require 'airport'
describe Airport do
  it "lands planes" do
    plane = Plane.new
    subject.land_plane(plane)
  end
end
