require 'plane'

describe Plane do
  describe ".position" do
    it "position method should respond when called by plane instance" do
      expect(subject).to(respond_to(:position))
    end
  end

  describe ".change_position" do
    it "change_position method changes plane's position from air to ground" do
      subject.change_position
      expect(subject.position).to(eq("ground"))
    end
    it "change_position method changes plane's position from ground to air" do
      plane = Plane.new("ground")
      plane.change_position
      expect(plane.position).to(eq("air"))
    end
  end
end
