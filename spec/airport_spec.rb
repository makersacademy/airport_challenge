system 'clear'
# calling aeroplane file
require 'airport'
require 'aeroplane'
# begin - checking airport Class
RSpec.describe Airport do
# begin - plane landing
  it 'instructing a plane to land at an airport' do
# arrange
    aeroplane = Aeroplane.new
    airport = Airport.new

    expect(airport.plane_land(aeroplane)).to eq "Plane safely landed at airport"
  end
# end - plane landing
# begin - takeoff
  it 'instructing a plane to takeoff from airport' do
    airport = Airport.new

    expect(airport.takeoff).to eq "Plane takeoff successful"
  end
# end - takeoff
# begin - confirm plane has taken takeoff
  it "confirmation that the aeroplane has left the airport" do
    airport = Airport.new

    expect(airport.conformation).to eq "Confirmed, the aeroplane has left the airport"
  end
# end - confirm plane has
# begin - 
end
# end - checking airport Class
