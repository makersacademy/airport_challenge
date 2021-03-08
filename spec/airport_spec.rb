require 'airport'
require 'plane'
require 'air_traf_con'

describe Airport do
  airport = Airport.new("O'Hare", 60)
  it 'has a name that can be read and defined' do
    expect(airport.name).to eq("O'Hare")
  end

  it 'has a capacity for planes that can be read and defined' do
    expect(airport.capacity).to eq(60)
  end

  it 'has a capacity for planes that will default to DEFAULT_CAPACITY if no capacity defined' do
    alternate = Airport.new("Heathrow")
    expect(alternate.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it 'can release a Plane' do
    plane = Plane.new(airport.name)
    plane.flying = true
    p airport.receive_plane(plane)
    expect(airport.release_plane(plane)).to eq(plane)
  end

  it 'can receive a Plane' do
    plane = Plane.new(airport.name)
    plane.flying = true
    expect(airport.receive_plane(plane)).to eq(plane)
  end

end
