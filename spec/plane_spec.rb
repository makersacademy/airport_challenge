require 'plane'

describe Plane do

  it 'registers a plane as landed' do
  plane = Plane.new
  airport = Airport.new
  airport.land(plane)
  expect(plane.airborn?).to eq false
  end

  it 'registers a plane as airborn' do
  plane = Plane.new
  airport = Airport.new
  airport.land(plane)
  airport.take_off(plane)
  expect(plane.airborn?).to eq true
  end

  # it 'confirms the status of a plane' do
  # plane = Plane.new
  # airport = Airport.new
  # airport.land(plane)
  # expect(plane.status).to eq "currently landed at an airport"
  # airport.take_off(plane)
  # expect(plane.airborn?).to eq "currently in the air"
  # end
end
