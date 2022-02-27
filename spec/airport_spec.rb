require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "stores a landing plane" do
    plane.land(plane, airport)
    expect(airport.aerodrome).to include(plane)
  end

  it "empties an aerodrome when the plane takes off" do
    plane.land(plane, airport)
    plane.take_off(plane, airport)
    expect(airport.aerodrome).to_not include(plane)
  end

  it "does not receive a plane if it is full" do
    Airport::DEFAULT_CAPACITY.times { plane.land(plane, airport) }
    expect { plane.land(plane, airport) }.to raise_error("airport is full")
  end
end
