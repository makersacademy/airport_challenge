require 'airport'
require 'plane'

describe 'Land plane and store in airport' do
  it 'Lands plane and stores in airport' do
    weather = Weather.new
    airport = Airport.new(weather)
    plane = Plane.new
    allow(weather).to receive(:rand).and_return(3)
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end
end
