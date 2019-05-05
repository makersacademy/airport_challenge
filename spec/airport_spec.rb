require 'airport'
require 'plane'
require 'weather'

describe Airport do
  it 'lists number of docked planes' do
    plane = Plane.new
    airport = Airport.new
    weather = double
    allow(weather).to receive(:condition) { 'good' }
    plane.land(weather, airport)
    expect(airport.planes).to eq(1)
  end

  it 'full airport prevents landing' do
    plane1 = Plane.new
    plane2 = Plane.new
    airport = Airport.new
    weather = double
    allow(weather).to receive(:condition) { 'good' }
    plane1.land(weather, airport)
    expect { plane2.land(weather, airport) } .to raise_error("can't land in a full airport")
  end
end
