require 'airport'
require 'plane'

describe 'plane takes off and plane removed from airport' do
  it 'removes plane from airport' do
    weather = Weather.new
    airport = Airport.new(weather)
    plane = Plane.new
    allow(weather).to receive(:rand).and_return(3)
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to be_empty
  end
  it 'will not allow a plane that is not landed at the airport to take off' do
    weather = Weather.new
    airport = Airport.new(weather)
    plane = Plane.new
    allow(weather).to receive(:rand).and_return(3)
    plane.landed
    expect { airport.take_off(plane) }.to raise_error "Plane is not at this airport"
  end
end
