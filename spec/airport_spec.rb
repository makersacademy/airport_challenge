require 'airport'

describe Airport do

  it "should recognise ability to call 'request_land'" do
    expect(subject).to respond_to(:request_land)
  end

  it "landed plane should then be inside airport" do
    plane = Plane.new
    port = Airport.new
    port.request_land(plane)
    expect(port.in_airport).to eq([plane])
  end

end
