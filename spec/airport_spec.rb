require "airport.rb"

describe Airport do
  it "is expected to respond to the method :land" do
    airport = Airport.new
    is_expected.to respond_to(:land)
  end

  it "should respond to the method :land with one argument" do
    is_expected.to respond_to(:land).with(1).argument
  end

  # it "gets a plane in the airport when passed :land" do
  #   airport = Airport.new
  #   expect(airport.land(plane)).to be_an_instance_of(Plane)
  # end

  it "should respond to the method :takeoff" do
    is_expected.to respond_to(:takeoff)
  end

  it "should takeoff a plane when passed :takeoff" do
    airport = Airport.new
    airport.land(Plane.new)
    expect(airport.takeoff).to be_an_instance_of(Plane)
  end

  it "returns true if plane is in the airport" do
    airport = Airport.new
    airport.land(Plane.new)
    expect(airport.takeoff.in_airport?).to be(false)
  end

  # it "should takeoff a plane from the airport" do
  #   airport = Airport.new
  #   expect(airport.takeoff)
  # end

end
