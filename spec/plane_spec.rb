require 'airport'
require 'plane'

describe Plane do
  airport = Airport.new
  plane = Plane.new
  it 'checks if the plane has landed' do
    airport.land(plane)
    expect(plane.landed?).to eq true
  end

  it 'checks if the plane has taken off' do
    airport.take_off(plane)
    expect(plane.taken_off?).to eq false
  end


end
