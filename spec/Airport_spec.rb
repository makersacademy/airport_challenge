require "Airport"
describe Airport do
  it "lands the plane at the airport" do
    port = Airport.new
    plane1 = Plane.new
    port.land(plane1)
    expect(port.airport).to include(plane1)
  end
  it "checks if the plan took off" do
    port = Airport.new
    plane2 = Plane.new
    port.take_off(plane2)
    expect(port.airport).not_to include(plane2)
  end
  it "prevent landing if aiport is full" do
    port = Airport.new(22)
    for i in 1..25
        port.land(Plane.new)
    end
    expect { port.land }.to raise_error "Airport is full"
  end 
end

