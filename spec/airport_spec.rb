require 'classes'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "creates an airport" do
    expect(airport).to be_an_instance_of Airport
  end

  it "can land a plane" do
    airport.land(plane)
    expect(airport.spaces).to include(plane)
  end

  it "has no planes when created" do
    expect(airport.spaces).to be_empty
  end
end
