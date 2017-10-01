require 'airport'
require 'plane'

describe Airport do

  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "Airport can land a plane" do
    expect(airport.land(plane)).to eq('Plane has landed safely')
  end

  it "A plane can takeoff from the airport" do
    expect(airport.takeoff(plane)).to eq('Plane has taken off safely')
  end

  # it "When a plane takes off it reduces the number of planes in the airport by one" do

  # end
end
