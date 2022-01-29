require 'airport'

describe AirPort do
  
  it "lands a plane in an airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "takes a plane, when landed and holds it" do
    airport = AirPort.new
    plane = Plane.new
    expect(airport.land(plane)).to eq [plane]
  end

end
