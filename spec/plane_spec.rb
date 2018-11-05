require 'plane'
require 'airport'

describe Plane do

  it 'can land at an airport' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(airport.hangar).not_to be_empty
  end

end
