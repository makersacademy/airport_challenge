require "airport"

describe "Tests for the landing of planes" do
  
  it "can land a plane at an airport" do
    airport = AirPort.new
    weather = Weather.new
    allow(weather).to receive(:stormy?).and_return(false)
    plane = Plane.new
    hanger = [plane]
    airport.land(plane, weather)
    expect(airport.airport_hanger).to eq(hanger)
  end
  
  it "a specific plane can takeoff from a hanger of multiple" do
    airport = AirPort.new
    weather = Weather.new
    allow(weather).to receive(:stormy?).and_return(false)
    plane = Plane.new
    plane2 = Plane.new
    airport.land(plane, weather)
    airport.land(plane2, weather)
    expect(airport.takeoff(plane, weather)).to eq(plane)
  end

  it "prevents landing when the airport is full" do
    airport = AirPort.new
    weather = Weather.new
    allow(weather).to receive(:stormy?).and_return(false)
    airport.capacity.times { airport.land(Plane.new, weather) }
    expect{airport.land(Plane.new, weather)}.to raise_error("Airport hanger is full")
  end

  it "doesnt allow take off with stormy weather" do
    airport = AirPort.new
    weather = Weather.new
    plane = Plane.new
    allow(weather).to receive(:stormy?).and_return(true)
    expect{airport.takeoff(plane, weather)}.to raise_error("Cannot take off in stormy weather")
  end
  it "doesnt allow landing with stormy weather" do
    airport = AirPort.new
    weather = Weather.new
    plane = Plane.new
    allow(weather).to receive(:stormy?).and_return(true)
    expect{airport.land(plane, weather)}.to raise_error("Cannot land in stormy weather")
  end
end
