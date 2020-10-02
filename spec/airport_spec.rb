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
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.spaces).not_to include(plane)
  end

  it "cannot land planes if full" do
    airport.capacity.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error("Airport full, landing denied.")
  end
  
  it "capacity can be changed" do
    new_airport = Airport.new(200)
    200.times { new_airport.land(plane) }
    expect { new_airport.land(plane) }. to raise_error("Airport full, landing denied.")
  end

  it "cannot takeoff a plane if airport empty" do
    expect { airport.takeoff(plane) }.to raise_error("There are no planes to take off")
  end

  it "cannot takeoff a plane that is flying" do
    airport.land(plane)
    plane.flying
    expect { airport.takeoff(plane) }.to raise_error("Plane already flying")
  end
end
