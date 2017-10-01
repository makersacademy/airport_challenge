require 'airport'
require 'plane'

describe Airport do

  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "Airport can land a plane" do
    expect(airport.land(plane)).to eq('Plane has landed safely')
  end
end
