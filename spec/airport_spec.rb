require 'airport'
require 'plane'

describe Airport do

  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "Airport can land a plane" do
    expect(airport.land(plane)).to eq("#{plane} has landed safely")
  end

  it "A plane can takeoff from the airport" do
    expect(airport.takeoff(plane)).to eq("#{plane} has taken off safely")
  end

end
