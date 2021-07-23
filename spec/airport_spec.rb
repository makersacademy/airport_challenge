require "airport.rb"

describe "Airport" do
  describe "#land" do
    it "should land and store a single plane in the airport" do
      airport = Airport.new
      airport.land(Plane.new)
      expect(airport.hanger.working?).to(eq(true))
    end
  end
end
