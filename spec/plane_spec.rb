require "plane"
describe Plane do
  it "Making a plane in possible" do
    plane = Plane.new()
  end

  it "A plane is able to land in an airport,when the weather is sunny." do
    plane = Plane.new()
    airport = Airport.new()
    allow(airport).to receive(:weather_conditions) { "sunny" }
    plane.land(airport)
  end

  it "A plane is able to take off from an airport when the weather is good." do
    plane = Plane.new()
    airport = Airport.new()
    allow(airport).to receive(:weather_conditions) { "sunny" }
    plane.land(airport)
    plane.take_off(airport)
  end

  it " When a plane has landed in the airport, it is  in airport." do
    plane = Plane.new()
    airport = Airport.new()
    allow(airport).to receive(:weather_conditions) { "sunny" }
    plane.land(airport)
    expect(plane.in?(airport)).to eq true

  end

  it "when a plane has taken off the airport, it is not in airport anymore." do
    plane = Plane.new()
    airport = Airport.new()
    allow(airport).to receive(:weather_conditions) { "sunny" }
    plane.land(airport)
    allow(airport).to receive(:weather_conditions) { "sunny" }
    plane.take_off(airport)
    expect(plane.in?(airport)).to eq false
  end

  it "When the weather is stormy, the planes are not allowed to take_off." do
    plane = Plane.new()
    airport = Airport.new()
    allow(airport).to receive(:weather_conditions) { "stormy" }
    expect { plane.take_off(airport) }.to raise_error("The weather is stormy")

  end

  it "When the weather is stormy, the plane is not allowed to land." do
    plane = Plane.new()
    airport = Airport.new()
    allow(airport).to receive(:weather_conditions) { "stormy" }
    expect { plane.land(airport) }.to raise_error("The weather is stormy")
  end

  it "when the airport is full(with default capacity of 1), no airplane is allowed to land" do
    plane = Plane.new()
    airport = Airport.new()
    plane2 = Plane.new()
    allow(airport).to receive(:weather_conditions) { "sunny" }
    plane.land(airport)
    expect { plane2.land(airport) }.to raise_error("The airport is full.")
  end

  it "When the airport is full(with a defined capacity), we are not allowed to land" do
    airport = Airport.new(11)
    allow(airport).to receive(:weather_conditions) { "sunny" }
    expect { 12.times { Plane.new().land(airport) } }.to raise_error "The airport is full."

  end

  it "A plane which has landed previously, can not land again." do
    airport = Airport.new(3)
    plane = Plane.new()
    allow(airport).to receive(:weather_conditions) { "sunny" }
    plane.land(airport)
    expect { plane.land(airport) }.to raise_error("The plane has already landed in the airport.")
  end

  it "Prevents a plane that does not exis in an airport from taking off." do
    airport = Airport.new()
    plane = Plane.new()
    allow(airport).to receive(:weather_conditions) { "sunny" }
    expect { plane.take_off(airport) }.to raise_error("The plane does not exist in the airport.")
  end
end
