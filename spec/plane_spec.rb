require_relative "../lib/plane"

RSpec.describe Plane do
  describe ".change_status" do
    it "changes whether the plane is 'flying' or 'not'" do
      plane = Plane.new
      plane.change_status
      expect(plane.flying?).to eq true
    end
  end

  describe ".flying?" do
    it "return true if the plane is currently flying and false if it's not" do
      plane = Plane.new
      expect(plane.flying?).to eq false
    end
  end
end
