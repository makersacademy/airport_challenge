require "plane"

describe Plane do
  it "should have a status of 'airborne' when created" do
      plane = Plane.new
      expect(plane.status) == "airborne"
      end
  it "it should be possible to change status to 'landed'" do
      plane = Plane.new
      plane.status = "landed"
      expect(plane.status) == "landed"
    end
end
