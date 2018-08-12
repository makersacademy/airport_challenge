require "Airport"
describe Airport do
  subject(:airport) { described_class.new }

  describe "#land" do
    it "Lands a plane" do
      plane = Plane.new
      airport.land(plane)
      expect(airport.land(plane)).to eq "#{plane} has landed"
    end
  end

  describe "#takeoff" do
    it "Allows a plane to take off, confirm it is no longer in the hangar" do
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "#{plane} has taken off"
      expect(airport.hangar).not_to include(plane)
    end 
  end
end
