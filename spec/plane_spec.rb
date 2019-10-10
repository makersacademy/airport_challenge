require "plane.rb"

  describe Plane do
    it { is_expected.to respond_to :working? }

  describe Plane do
    it "working should equal true" do
      plane = Plane.new
      expect(plane.working?).to be(true)
    end
  end
end
