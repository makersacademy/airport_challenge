require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  it { is_expected.to respond_to :land }

  it "lands a plane" do
    plane = Plane.new
    airport.land(plane)
    expect(plane.landed?).to eq true
  end

  it "takes off a plane" do
    plane = Plane.new
    airport.takeoff(plane)
    expect(plane.landed?).to eq false
  end

end
