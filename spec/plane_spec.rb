require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  describe "#land_at_airport" do
    it "plane lands at airport" do
      expect(plane).to respond_to :land_at_airport
    end
  end

end
