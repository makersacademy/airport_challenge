require 'airport'
describe Airport do
  it "lands a plane" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane).length).to eq 1
  end
end
