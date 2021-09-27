require 'airport'
require 'Plane'

RSpec.describe Airport do
  describe "Set initial plane number" do
    it "@plane_count" do
      expect(subject.initialise(1)).to eq(1)
    end
  end

  describe "Set_limit max_planes" do
    it "@plane_limit" do
      expect(subject.set_limit(20)).to eq(20)
    end
  end

  describe "plane_limit check" do
    it "@@plane_count >= @@plane_limit" do
      subject.initialise(11)
      subject.set_limit(10)
      expect(subject.plane_limit_check).to eq(true)
    end
    it "@@plane_count < @@plane_limit" do
      subject.initialise(9)
      subject.set_limit(10)
      expect(subject.plane_limit_check).to eq(false)
    end
  end
end