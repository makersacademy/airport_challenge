require 'airport'
require 'plane'

describe 'Airport at full capacity' do
  it 'Will not allow further plane to land - error will be raised' do
    weather = Weather.new
    airport = Airport.new(weather)
    plane = Plane.new
    plane2 = Plane.new
    allow(weather).to receive(:rand).and_return(3)
    airport.land(plane)
    expect { airport.land(plane2)}.to raise_error 'Airport at full capacity'
  end
end
