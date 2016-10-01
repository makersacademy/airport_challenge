require 'airport'
require 'plane'

describe Airport do
    subject(:airport) {described_class.new}

    before(:each) do
      @landed = []
      plane = Plane.new
    end

  describe "#land" do
    it {is_expected.to respond_to(:land).with(1).arguments}

    it "allows the plane to land" do
      plane = Plane.new
      airport.land(plane)
      expect(@landed).to eq @landed << plane
    end

    it "confirms that the plane has landed" do
      plane = Plane.new
      airport.land(plane)
      expect(airport.land(plane)).to eq "The plane has already landed"
    end
  end

  describe "#take off" do
    it {is_expected.to respond_to(:take_off)}

    it "confirms that the plane has taken off and it is no longer in the airport" do
      airport.take_off
      expect(airport.take_off).to eq "The plane has taken off and it is no longer in the airport"
    end
  end
end
