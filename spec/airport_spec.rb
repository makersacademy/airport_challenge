require './airport'

describe Airport do
  let(:airport) { Airport.new }
  context "Plane landing" do
    it "method functions properly" do
      expect(airport).to(respond_to(:landing).with(1).argument)
    end
    it "successful" do
      plane = Plane.new
      airport.landing(plane)
      expect(airport.planes.length).to(eq(1))
    end
  end
  context "Plane taking off" do
    it "successfully" do
      airport.planes << Plane.new
      airport.take_off()
      expect(airport).to(respond_to(:take_off))
    end
    it "and not in airport" do
      expect(airport.planes.length).to(eq(0))
    end
  end
  context "Airport is full" do
    it "so landing is forbidden" do
      10.times { airport.planes << Plane.new }
      expect(airport.planes.length).to(eq(airport.capacity))
    end
  end
  context "Airport capacity" do
    it "is default" do
      expect(airport.capacity).to(eq(10))
    end
    it "is custom" do
      airport = Airport.new(11)
      expect(airport.capacity).not_to(eq(10))
    end
  end
end
