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

  it "can instruct a plane to take off and confirm plane is gone" do
    airport.takeoff(plane)
    expect(airport.spaces).not_to include(plane)
  end

  it "has a default capacity" do
    expect(Airport::DEFAULT_CAPACITY).to exist
  end

  it "cannot land planes if full" do
    Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
    expect{airport.land(plane)}.to raise_error("Airport full, landing denied.")
  end
  
end
