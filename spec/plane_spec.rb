require 'plane'

describe Plane do

  it 'confirms that plane is landed'do
  airport = Airport.new
  plane = Plane.new
  airport.land(plane)
  expect(plane.landed?).to eq true
  end

  it 'confirms plane is in the air' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(plane.in_air?).to eq true
  end
end
