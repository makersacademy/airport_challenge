require './lib/airport'
require './lib/plane'
require './lib/weather_report'

describe Weather do
  airport = Airport.new
  plane = Plane.new

  it 'plane won\'t take off if weather is stormy' do
    expect(airport).to receive(:stormy?).and_return(true)
    expect { airport.take_off(plane) }.to raise_error 'Conditions too stormy to take off'
  end

  it 'plane won\'t land if weather is stormy' do
    expect(airport).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_error 'Conditions too stormy to land'
  end
end
