require_relative "../lib/plane"
require_relative "../lib/airport"
describe Plane do
  it "Check whether a plane is in_flight" do
    plane = Plane.new
    expect(plane.in_flight).to eq false
  end
  it "Check whether a plane is not in_flight" do
    airport = Airport.new
    allow(airport).to receive(:weatherbad?).and_return (false)
    plane = Plane.new
    airport.land(plane)
    airport.takeoff
    expect(plane.in_flight).to eq true
  end
end
