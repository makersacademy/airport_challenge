require 'airport'

describe Airport do
  it 'adds a plane' do
    airport = Airport.new
    airport.add_plane('AF7264')

    expect(airport.planes).to(eq(['AF7264']))
  end

  # it 'adds plane?' do
  #   airport = Airport.new
  # end
end