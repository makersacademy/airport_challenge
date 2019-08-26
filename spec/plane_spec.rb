require 'plane'

describe "air traffic control" do
	
  it "can land a plane" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    allow(airport.weather).to receive(:check).and_return(0.5)
    expect(airport.hangar).to include(plane)
  end
	
  it "can instruct a plane to take off" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    allow(airport.weather).to receive(:check).and_return(0.5)
    expect(airport.hangar).to_not include(plane)
  end
  
  it "can prevent take-off during unfavourable weather" do
    airport = Airport.new
    plane = Plane.new
    allow(airport.weather).to receive(:check).and_return(0.5)
    airport.land(plane)
    allow(airport.weather).to receive(:check).and_return(0.01)
    expect { airport.take_off(plane) }.to raise_error("Take-off not permitted due to weather")
  end
  
  it "can prevent landing during unfavourable weather" do
    airport = Airport.new
    plane = Plane.new
    allow(airport.weather).to receive(:check).and_return(0.01)
    expect { airport.land(plane) }.to raise_error("Landing not permitted due to weather")
  end
  
  it "sets a default capacity of 20 if not otherwise specified" do
    expect(Airport.new.capacity).to eq(20)
  end
  
  it "prevents a plane from landing at a full airport" do
    airport = Airport.new(1)
    airport.land(Plane.new)
    expect { airport.land(Plane.new) }.to raise_error("No available space for this plane") 
  end
end
