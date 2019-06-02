require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  it 'tells a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end
  it "adds a new plane to hangar" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.hangar).to include(plane)
  end

  it "tells a plane to take off" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
end
