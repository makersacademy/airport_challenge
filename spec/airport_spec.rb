require 'airport'

describe Airport do
  it "lands a plane" do
    airport = Airport.new
    expect(airport.land(Plane.new)).to eq ("The plane has successfully landed")
  end

end
