require_relative "../lib/plane"

RSpec.describe Plane do
  describe ".initialize" do
    it "create a new plane object at the airport which is not flying" do
      plane = double("Plane", :flying => false)
      plane = Plane.new
      expect(plane).to eq plane
    end
  end

  describe ".change_status" do
    it "changes whether the plane is 'flying' or 'not'" do
      plane = Plane.new
      plane.change_status
      expect(plane.flying?).to eq true
    end
  end
end
