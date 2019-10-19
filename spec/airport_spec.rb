require "airport"
require "plane"
describe Airport do

  subject(:an_airport) { Airport.new }
  subject(:a_plane) { Plane.new }
  context "When Sunny airport is open" do
    it "open_for_landing? returns true" do
      # mock rand to set weather class to return "Sunny"
      allow(Kernel).to receive(:rand).and_return(2)
      expect(an_airport.open_for_landing?).to eq true
    end
  end

  context "When Stormy airport is closed" do
    it "open_for_landing? returns false" do
      # mock rand to set weather class to return "Sunny"
      allow(Kernel).to receive(:rand).and_return(1)
      expect(an_airport.open_for_landing?).to eq false
    end
  end

  describe "land" do
    it "land a plane when sunny" do
      allow(an_airport).to receive(:open_for_landing?).and_return(true)
      expect(an_airport.land(a_plane)).to eq [a_plane]
      expect(an_airport.planes[0].airport).to eq an_airport
    end

    it "raise an error if landing a plane while stormy" do
      allow(an_airport).to receive(:open_for_landing?).and_return(false)
      expect { an_airport.land(a_plane) }.to raise_error(RuntimeError, "Stormy, can't land planes")
    end
  end
end
