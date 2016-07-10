require 'airport'
require 'plane'

describe Airport do

  let(:airport1) {Airport.new}
  let(:plane1) {Plane.new}

  context "planes landing and take-off" do

    it "a plane can be instructed to land" do
      airport1.land_plane(plane1)
    end

    it "a plane can be instructed to take-off" do
      airport1.take_off_plane(plane1)
    end

    it "confirms that the plane has landed" do
      expect( airport1.land_plane( plane1 ) ).to eq "#{plane1} has successfully landed"
    end

    it "confirms that the plane has taken-off" do
      expect( airport1.take_off_plane( plane1 ) ).to eq "#{plane1} has successfully taken-off"
    end
  end
end
