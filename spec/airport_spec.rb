require 'airport'
describe Airport do
  it "receives a plane that has been instructed to land and stores it in the hangar" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(airport.hangar).to include(plane)
  end
  it "no longer holds a plane that has been instructed to take off" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    plane.take_off(airport)
    expect(airport.hangar).not_to include(plane)
  end
end
