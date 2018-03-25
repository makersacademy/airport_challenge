require "airport.rb"

describe Airport do
  it "is expected to respond to the method :land" do
    is_expected.to respond_to(:land)
  end

  it "should respond to the method :land with one argument" do
    is_expected.to respond_to(:land).with(1).argument
  end

  it "should respond to the method :takeoff" do
    is_expected.to respond_to(:takeoff)
  end

  it "should takeoff a plane when passed :takeoff" do
    airport = Airport.new
    airport.land(Plane.new)
    expect(airport.takeoff).to be_an_instance_of(Plane)
  end

  it "returns false if plane is not in the airport" do
    airport = Airport.new
    airport.land(Plane.new)
    expect(airport.takeoff.in_airport?).to be(false)
  end

  it "prevents takeoff when weather is stormy" do
    double(:weather, "stormy")
    airport = Airport.new
    expect { airport.takeoff }.to raise_error("Cannot takeoff due to stormy weather")
  end

  it "prevents landing when weather is stormy" do
    allow(Airport).to receive(:weather).with(10)
    airport = Airport.new
    expect { airport.land(Plane.new) }.to raise_error("Cannot takeoff due to stormy weather")
  end
end
