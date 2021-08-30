require 'airport'
require 'airplane'

describe Airport do
  it 'so a plane can land, tell a plane to land' do
    airport = Airport.new
    plane = Airplane.new
    expect { airport.land(plane)}.not_to raise_error
  end
end