require 'airport'
require 'Plane'

RSpec.describe Airport do
  describe "Set initial plane number" do
    it "@plane_count" do
      expect(subject.initialise(1, 10)).to eq(1, 10)
    end
  end

  describe "Set_limit max_planes" do
    it "@plane_limit" do
      expect(subject.set_limit(20).to eq(20))
    end
  end
end