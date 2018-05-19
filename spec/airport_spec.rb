require "airport"
describe Airport do
  it "responds to #land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "responds to #take_off" do
    expect(subject).to respond_to(:take_off)
  end

  describe "take_off" do
    it "checks if the plane that took of is no longer in the airport" do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport.take_off).to eq plane
    end
  end

end
