require_relative "../lib/plane"

RSpec.describe Plane do
  describe ".initialize" do
    it "create a new plane object at the airport which is not flying" do
      plane = Plane.new
      default_plane_flying = false
      expect(plane.flying).to eq default_plane_flying
    end
  end
end
