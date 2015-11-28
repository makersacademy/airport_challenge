require 'plane'

describe Plane do

  it 'confirms that plane is landed'do
  airport = Airport.new
  plane = Plane.new
  airport.land(plane)
  expect(plane.landed?).to eq true
  end

end
