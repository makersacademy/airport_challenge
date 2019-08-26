require "airport.rb"
require "plane.rb"

describe Airport do
  it "feature test land 2 airplanes and have them take off again" do
    a = Airport.new
    allow(a).to receive(:weather) { "sunny" }
    x = Plane.new
    y = Plane.new
    a.land(x)
    a.land(y)
    expect(a.planes).to eq([x,y])
    expect(x.state).to eq("landed")
    expect(y.state).to eq("landed")
    a.takeoff(x)
    a.takeoff(y)
    expect(a.planes).to eq([])
    expect(x.state).to eq("flying")
    expect(y.state).to eq("flying")
  end

end
