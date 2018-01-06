require 'airport'
require 'plane'
require 'weather'

describe 'Planes will not be able to land if weather report is stormy' do
  it 'ATC requests plane to land - unable to land - error raised' do
    weather = Weather.new
    airport = Airport.new(weather)
    plane = Plane.new
    allow(weather).to receive(:rand).and_return(5)
    expect { airport.land(plane) }.to raise_error 'Unable to land - weather is stormy'
  end
end

describe 'Planes can land if weather does not report stormy conditions' do
  it 'ATC requests plane to land - plane lands in airport' do
    weather = Weather.new
    airport = Airport.new(weather)
    plane = Plane.new
    allow(weather).to receive(:rand).and_return(3)
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end
end
