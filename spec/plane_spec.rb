require 'plane'
require 'airport'

describe Plane do
  it 'can land at an airport if not already landed' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(airport.show_planes).to include(plane)
    expect { plane.land(airport) }.to raise_error('This plane has already landed')
  end
  it 'can take off if currently at an airport' do
    plane = Plane.new
    expect { plane.take_off }.to raise_error('The plane is not on the ground')
    airport = Airport.new
    plane.land(airport)
    expect { plane.take_off }.not_to raise_error
  end
end
