require 'airport'
require 'plane'

describe Airport do
  it "is not full" do
    airport = Airport.new
    plane = Plane.new

    expect(airport.add_plane(plane)).to eq('Plane is landed')
  end

  it "is full" do
    airport = Airport.new
    plane = Plane.new
    3.times { airport.add_plane(plane) }

    expect(airport.add_plane(plane)).to eq('Airport is full')
  end

  it "send a plane away" do
    airport = Airport.new
    expect(airport.remove_plane).to eq('Plane has left airport')
  end

  it "is empty" do
    airport = Airport.new
    expect(airport.empty?).to eq(true)
  end

end
