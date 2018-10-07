require './lib/plane'
require './lib/weather'
require './lib/airport'
describe Airport do
  it "plane to land at airport" do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
  end
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
  it "prevent landing when the airport is full" do
    plane = Plane.new
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    airport = Airport.new
    airport.land(plane1)
    airport.land(plane2)
    airport.land(plane3)
    expect { airport.land(plane) }.to raise_exception "The airport is full ,piss off"
  end
  #As the system designer
  #So that the software can be used for many different airports
  #I would like a default airport capacity that can be overridden as appropriate
  it "defaults airport capacity that can be overriden for diferent airports"
  
end
