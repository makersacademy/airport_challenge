require "plane"
describe Plane do
  it "Making a plane in possible" do
    plane = Plane.new()
  end

  it "A plane is able to land in an airport,when the weather is sunny." do
    plane = Plane.new()
    airport = Airport.new()
    allow(airport).to receive(:weather_conditions){"sunny"}
    plane.land(airport)
  end

  it "A plane is able to take off from an airport when the weather is good." do
    plane = Plane.new()
    airport = Airport.new()
    allow(airport).to receive(:weather_conditions){"sunny"}
    plane.take_off(airport)
  end

  it " When a plane has landed in the airport, it is  in airport." do
    plane = Plane.new()
    airport = Airport.new()
    allow(airport).to receive(:weather_conditions){"sunny"}
    plane.land(airport)
    expect(plane.is_in?(airport)).to eq true

  end

  it "when a plane has taken off the airport, it is not in airport anymore." do
    plane = Plane.new()
    airport = Airport.new()
    allow(airport).to receive(:weather_conditions){"sunny"}
    plane.land(airport)
    allow(airport).to receive(:weather_conditions){"sunny"}
    plane.take_off(airport)
    expect(plane.is_in?(airport)).to eq false
  end

  it "When the weather is stormy, the planes are not allowed to take_off." do
    plane = Plane.new()
    airport = Airport.new()
    allow(airport).to receive(:weather_conditions){"stormy"}
    expect {plane.take_off(airport)}.to raise_error("The weather is stormy")

  end

  it "When the weather is stormy, the plane is not allowed to land." do
    plane = Plane.new()
    airport = Airport.new()
    allow(airport).to receive(:weather_conditions){"stormy"}
    expect {plane.land(airport)}.to raise_error("The weather is stormy")
  end

  it "when the airport is full(with 1 capacity), no airplane is allowed to land" do
    plane = Plane.new()
    airport = Airport.new()
    plane2 = Plane.new()
    allow(airport).to receive(:weather_conditions){"sunny"}
    plane.land(airport)
    expect {plane2.land(airport)}.to raise_error("The airport is full.")


  end

end
