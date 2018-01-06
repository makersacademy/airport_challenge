require 'airport'
require 'plane'
require 'weather'

describe 'Planes will not take off if weather report is stormy' do
  it 'ATC requests plane to take off - weather is stormy' do
    weather = Weather.new
    airport = Airport.new(weather)
    plane = Plane.new
    allow(weather).to receive(:stormy?).and_return(true)
    airport.land(plane)
    expect { plane.take_off }.to raise_error 'Unable to take off - weather is stormy'
  end
end

describe 'Planes can take off if weather does not report stormy conditions' do
  it 'ATC requests plane to take off - weather is clear' do
    weather = Weather.new
    airport = Airport.new(weather)
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to be_empty
  end
end
