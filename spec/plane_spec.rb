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
    allow(airport.weather).to receive(:check).and_return(0.01)
    expect {airport.land(plane)}. to raise_error("Landing not permitted due to weather conditions")
  end  	
end
