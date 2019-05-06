require "airport"

describe Airport do
  describe "#landing" do
    context "given airport has space" do
      it "allows plane to land" do
        plane = Plane.new
        airport = Airport.new
        airport.land(plane)
        expect(airport.hanger.include?(plane)).to eq(true)
      end
    end
  end
  describe "#takeoff" do
    context "given weather is good" do
      it "allows plane to takeoff" do
        plane = Plane.new
        airport = Airport.new
        airport.land(plane)
        airport.takeoff(plane)
        expect(airport.hanger.include?(plane)).to eq(false)
      end
    end
  end
end
