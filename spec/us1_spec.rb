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
  it "- Class to respond to a request to give a list of all planes" do
    expect(Plane).to respond_to(:list_all_planes)
  end

  describe ".list_planes" do
    it "- provide an array of 0 or more 'Plane' objects" do
      expect(Plane.list_all_planes).to be_an_instance_of(Array)
    end
  end
end

# ability for the controller to instruct a plane to land
RSpec.describe Plane do
  it "- to accept Controller instruction to 'land'" do
    expect(subject).to respond_to(:land)
  end

  describe ".land" do
    it "- change plane 'status' to 'on_ground'" do
      subject.location = "in_air"
      subject.land
      expect(subject.location).to eq("on_ground")
    end
  end
end

RSpec.describe Airport do

end
