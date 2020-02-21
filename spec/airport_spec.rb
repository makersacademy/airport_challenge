require "airport"
describe Airport do
  it "allows plane to land" do
    #we have an airport, we have a plane
    airport = Airport.new
    plane = Plane.new
    #act/assert
    expect(airport.land(plane)).to eq(1)
  end
  it "allows plane to take off" do
    #arrange = we have an airport, we have a plane, we have landed a plane
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    #act/assert
    expect(airport.take_off(plane)).to eq(0)
  end
end
