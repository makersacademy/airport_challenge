require 'airport'

describe 'Airport Feature Test' do

  airport = Airport.new(2)
  plane = Plane.new
  plane2 = Plane.new
  weather = Weather.new
  let(:traffic_control) {double("traffic_control")}

  it "should accept multiple planes" do
    allow(traffic_control).to receive(:permission?) {true}
    p plane.land(traffic_control)
    p plane2.land(traffic_control)
    p airport.plane_arrival(plane)
    p airport.plane_arrival(plane2)
    p airport.see_terminal
  end

  it "should release a specific plane" do
    allow(traffic_control).to receive(:permission?) {true}
    p plane2.take_off(traffic_control)
    p airport.plane_departure(plane2)
    p airport.see_terminal
  end

end
