require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {Plane.new}

  describe "#plane_landing" do
    it "plane lands at airport" do
      expect(airport).to respond_to :plane_landing
    end
  end

end
