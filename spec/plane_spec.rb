require './lib/plane.rb'

RSpec.describe Plane do
  describe "permission_to_land" do
    it "landing permission default" do
      expect(subject.landing_permission?).to eq(nil)
    end
    it "landing permission to equal true" do
      subject.permisson_to_land
      expect(subject.landing_permission?).to eq(true)
  end
  end
end
