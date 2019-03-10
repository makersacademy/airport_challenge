# Feature lab
require 'airport'
require 'plane'

describe "Features lab:" do
  it 'Plane landing' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end

  it 'Plane leaving' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end

end
