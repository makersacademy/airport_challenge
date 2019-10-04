require "plane.rb"

  describe Plane do
    it { is_expected.to respond_to :test }

  describe Plane do
    it "working should equal true" do
      plane = Plane.new
      expect(plane.test).to be(true)
    end
  end
end
