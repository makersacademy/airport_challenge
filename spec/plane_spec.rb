require './lib/plane.rb'

RSpec.describe Plane do
  describe "permission_to_land" do
    it "permission default" do
      expect(subject.permission?).to eq(nil)
    end
    it "permission to equal true" do
      subject.permisson_to_land
      expect(subject.permission?).to eq(true)
  end
  end
end
