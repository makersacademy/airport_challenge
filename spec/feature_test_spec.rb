require 'plane'
require 'airport'

describe Airport do
  it 'lands planes' do
    jfk = Airport.new
    airbus380 = Plane.new
    jfk.land_plane(airbus380)
    expect(airbus380.landed?).to eq true
    puts "A plane has landed at the airport" if airbus380.landed?
  end
end
