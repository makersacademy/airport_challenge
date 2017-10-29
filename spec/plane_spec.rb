require 'plane'
require 'airport'

describe Plane do
  it { is_expected.to respond_to(:land) }
  it "Should land at an airport" do
    airport = Airport.new
    subject.land(airport)
    expect(airport.landed_planes[-1]).to eq subject
  end
end
