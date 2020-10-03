require 'airport'
describe Airport do
  it "receives a plane that has been instructed to land and stores it in the hangar" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(airport.hangar).to include(plane)
  end
end
