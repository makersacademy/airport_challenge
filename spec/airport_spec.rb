require 'airport'
describe Airport do
  it "plane to land at airport" do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end
  it "instruat a plane to take off" do
    plane = Plane.new
    expect(Airport.new).to respond_to(:take_off)
  end
end
