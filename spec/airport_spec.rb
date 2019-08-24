require 'airport'
require 'plane'

describe Airport do

  it 'tracks a plane that is flying to it' do
    plane = Plane.new
    airport = Airport.new
    airport.track_plane(plane)
    expect(airport.planes).to include plane
  end

  it 'instructs a plane to land at an airport' do
    plane = Plane.new
    airport = Airport.new
    airport.instruct_landing(plane)
    expect(plane.is_flying).to eq false
  end

  it 'instructs a plane to take off from an airport' do
    plane = Plane.new
    airport = Airport.new
    airport.instruct_take_off(plane)
    expect(plane.land).to eq false
  end

end
