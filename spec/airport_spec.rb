require 'airport'
require 'plane'
require 'weather'
describe Airport do
  it 'lists number of docked planes' do
    plane = Plane.new
    airport = Airport.new
    weather = Weather.new
    plane.land(weather, airport)
    expect(airport.planes).to eq(1)
  end
end
