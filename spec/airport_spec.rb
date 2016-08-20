require 'airport'

describe Airport do

  it "should recognise ability to call 'request_land'" do
    expect(subject).to respond_to(:request_land)
  end

  it "landed plane should then be inside airport" do
    plane = Plane.new
    port = Airport.new
    port.request_land(plane)
    expect(port.in_airport).to include(plane)
  end

  it "should recognise ability to call 'request_depart'" do
    expect(subject).to respond_to(:request_depart)
  end

  it "departed plane should no longer be inside airport" do
    plane = Plane.new
    port = Airport.new
    port.request_depart(plane)
    expect(port.in_airport).not_to include(plane)
  end

end
