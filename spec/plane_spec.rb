require './lib/plane.rb'

describe Plane do
  it 'should instruct plane to land at the specified airport' do
    plane = Plane.new
    airport_double = double(:airport, land_plane: "")

    plane.land(airport_double)

    expect(airport_double).to have_received(:land_plane).with(plane)
  end
end
