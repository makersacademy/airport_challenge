require 'airport'
describe Airport do
  it "lands planes" do
    plane = Plane.new
    subject.land_plane(plane)
  end
  
  # planes can take off from an airport
  describe "#plane_take_off" do
    it { is_expected.to respond_to :plane_take_off }
  end
end
