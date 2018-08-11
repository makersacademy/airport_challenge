require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  it 'can land' do
    airport = Airport.new
    landed_plane = airport.land(plane)
  end
end
