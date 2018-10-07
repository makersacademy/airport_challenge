require './lib/airport'
require './lib/plane'
require './lib/weather'
require './lib/airport'
describe Airport do
  it "plane to land at airport" do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    allow(airport).to receive(:stormy).and_return(false)
    expect(airport.planes).to eq [plane]
  end
  it "instruct a plane to take off" do
    expect(Airport.new).to respond_to(:take_off)
  end
  it "prevent the plane to take off if weather is stormy" do
    plane = Plane.new
    airport = Airport.new
    expect(airport).to receive(:stormy).and_return(true)
    expect { airport.take_off(plane) }.to raise_exception "Can not take of if the weather is stormy"
  end
  it "Checks if stormy return's true or false" do
    expect(subject.stormy(true)).to eq true
  end
end
