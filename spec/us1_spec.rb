# this is a set of tests to run as a "Functional Test"
# testing the capabilities of the Air Traffic controller
require 'software_airport'

=begin
User story 1 -
As an Air Traffic Controller
So I can get passengers to a destination
I want to instruct a plane to land at an Airport
=end

# testing the class level variable to get list of planes created
RSpec.describe Plane do
  it "- Class instance to provide list of planes" do
    expect(Plane).to respond_to(:list_planes)
  end

  describe ".list_planes" do
    it "- provide an array of 0 or more 'Plane' objects" do
      expect(Plane.list_planes).to be_an_instance_of(Array)
    end
  end
end

# Test breakdown:
# ability for the controller to instruct a plane to land
RSpec.describe Plane do
  it "- to accept Controller instruction to 'land'" do
    expect(subject).to respond_to(:land)
  end

  describe ".land" do
    it "- change plane 'status' to 'on_ground'" do
      plane = Plane.new
      plane.status = "in_air"
      plane.land
      expect(plane.status).to eq("on_ground")

      plane.land
    end
  end
end

RSpec.describe Airport do

end
