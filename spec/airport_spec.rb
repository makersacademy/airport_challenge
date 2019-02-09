require 'airport'

describe Airport do
  it "can instruct a plane to land in good weather" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:weather) { 2 }
    airport.land(plane)
    expect(airport.planes).to include(plane)
  end

  it "prevents landing if weather is stormy" do
    airport = Airport.new
    plane = Plane.new

    allow(airport).to receive(:weather) { 99 }
    expect { airport.land(plane) }.to raise_error("bad weather: planes cannot land")
    expect(airport.planes).not_to include(plane)
  end

  it "prevents landing if airport is full" do
    airport = Airport.new
    allow(airport).to receive(:weather) { 2 }
    airport.capacity.times { airport.land(Plane.new) }
    plane = Plane.new
    expect { airport.land(plane) }.to raise_error("airport full")
    expect(airport.planes).not_to include(plane)
  end

  it "can instruct a plane to take off in good weather" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:weather) { 2 }
    airport.land(plane)
    expect(airport.take_off(plane)).to eq("plane has left")
    expect(airport.planes).not_to include(plane)
  end

  it "prevents take off if weather is stormy" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:weather) { 2 }
    airport.land(plane)

    allow(airport).to receive(:weather) { 99 }
    expect(airport.take_off(plane)).to eq("bad weather: plane has not left")
    expect(airport.planes).to include(plane)
  end

  it "can check that a plane has left the airport after instructing to take off" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:weather) { 2 }
    airport.land(plane)
    allow(plane).to receive(:take_off) {}
    expect { airport.take_off(plane) }.to raise_error "plane has not left"
    expect(airport.planes).to include(plane)
  end

  it "can check the weather" do
    expect(subject.weather).to be_between(0, 99)
  end

  it "can judge whether the weather is bad" do
    airport = Airport.new
    allow(airport).to receive(:weather) { 99 }
    expect(airport.bad_weather?).to eq(true)
    allow(airport).to receive(:weather) { rand(99) }
    expect(airport.bad_weather?).to eq(false)
  end
end
