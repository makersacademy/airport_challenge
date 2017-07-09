require 'Airport'
require 'Plane'

describe Airport do
  subject(:airport) { described_class.new }
  subject(:plane) { Plane.new }

  it "instructs a plane to land" do
    expect(airport).to respond_to(:land)
  end

  it "confirms that plane is in the airport" do
    airport.land(plane)
    expect(airport.planes).to include plane
  end

  it "instructs a plane to take off" do
    expect(airport).to respond_to(:take_off)
  end

  it "confirms that plane is no longer at the airport" do
    airport.land(plane)
    airport.take_off
    expect(airport.planes).not_to include plane
  end

end
