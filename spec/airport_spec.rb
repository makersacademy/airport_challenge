require './lib/plane'
require './lib/weather'
require './lib/airport'
describe Airport do
  it "plane to land at airport" do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
  end
  #I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it "instruct a plane to take off" do
    plane = Plane.new
    plane_2 = Plane.new
    airport = Airport.new
    airport.land(plane)
    airport.land(plane_2)
    airport.take_off(plane)
    expect(airport.planes).to eq [plane_2]
  end
  it "prevent the plane to take off if weather is stormy" do
    plane = Plane.new
    airport = Airport.new
    expect(airport).to receive(:stormy?).and_return(true)
    expect { airport.take_off(plane) }.to raise_exception "Can not take off if the weather is stormy"
  end
  it "prevent the plain to land if the weather is stormy" do
    plane = Plane.new
    airport = Airport.new
    expect(airport).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_exception "Can not land if the weather is stormy"
  end
end
