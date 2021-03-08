require 'airport'
require 'plane'
require 'air_traf_con'

describe Airport do
  it 'has a name that can be read and defined' do
    subject.name = "O'Hare"
    expect(subject.name).to eq("O'Hare")
  end

  it 'has a capacity for planes that can be read and defined' do
    airport = Airport.new("O'Hare", 60)
    expect(airport.capacity).to eq(60)
  end

  it 'has a capacity for planes that will default to DEFAULT_CAPACITY if no capacity defined' do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it 'can release a Plane' do
    plane = Plane.new(subject.name)
    subject.receive_plane(plane)
    expect(subject.release_plane).to eq(plane)
  end

  it 'can receive a Plane' do
    plane = Plane.new(subject.name)
    expect(subject.receive_plane(plane)).to include(plan)
  end

end
